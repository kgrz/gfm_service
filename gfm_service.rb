require 'goliath'
require_relative 'markdown/md.rb'
require 'json/ext'

module Goliath
  module Rack
    module Validator
      def validation_error(status_code, msg, headers={})
        headers.delete('Content-Length')
        # Without this override, the response would send a response in the form of 
        # [:error, msg] since Goliath doesn't care about which transport system we use
        [status_code, headers, [{:error => msg}.to_json]]
      end
    end
  end
end

# Using a simpler custom validator might do good here. That would make the above
# hack unnecessary too!
class CustomInvalidMethod < Goliath::Rack::Validation::RequestMethod
  def call(env)
    error_message = "Only POST requests please"
    return validation_error(405, error_message, "Allow" => "POST") unless env['REQUEST_METHOD'] == "POST"
    @app.call(env)
  end
end

class GfmService < Goliath::API
  
  use CustomInvalidMethod, %w{POST}

  def on_body(env, data)
    dat = CGI.parse(data)

    text = dat["text"].any? ? dat["text"].first : ""
    mode = dat["mode"].any? ? dat["mode"].first : "gfm" 

    markdown  = Md.new

    (env["md_to_html"] ||= "") << markdown.render(text).chomp
   end

  def response(env)
    env["md_to_html"] ||= ""

    [ 200, {'Content-Type' => 'text/html'}, [env["md_to_html"]] ]
  end
end


