Gem::Specification.new do |s|
  s.name = 'gfm_service'
  s.version = '0.0.1'
  s.platform = Gem::Platform::RUBY
  s.author = 'Kashyap Kondamudi'
  s.email = 'kashyap.kmbc@gmail.com'
  s.summary = "The GitHub Flavoured Markdown web service"
  s.description = "Follows the GitHub Markdown v3 API spec"

  s.files = ["gfm_service.rb", "README.md"] + Dir.glob("markdown/*")
  s.executables = ["gfm_service"]

  s.add_dependency "goliath"
  s.add_dependency "redcarpet"

  s.add_development_dependency "rspec"
  s.add_development_dependency "pry"
end
