require 'goliath'
require_relative 'markdown/md.rb'

class GfmService < Goliath::API
  
  use Goliath::Rack::Validation::RequestMethod, %w{POST}

  def on_body(env, data)
    dat = CGI.parse(data)

    text = dat["text"].any? ? dat["text"].first : ""
    mode = dat["mode"].any? ? dat["mode"].first : "gfm" 

    markdown  = Md.new

    (env["md_to_html"] ||= "") << markdown.render(text)
   end

  def response(env)
    env["md_to_html"] ||= ""

    [ 200, {'Content-Type' => 'text/html'}, [env["md_to_html"]] ]
  end
end


