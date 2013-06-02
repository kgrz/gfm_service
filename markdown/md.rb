require_relative "md_renderer.rb"

class Md

  attr_reader :renderer

  def initialize(mode = "gfm")
    @renderer = MdRenderer.new(mode)
  end

  def render(text)
    a = Redcarpet::Markdown.new(renderer)
    a.render(text)
  end

end
