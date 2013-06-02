require_relative "gfm_md_renderer.rb"

class MdRenderer
  def self.new(mode)
    case mode
    when "gfm"
      GfmMdRenderer
    else
      Redcarpet::Render::HTML
    end
  end
end
