require File.expand_path("../lib/version", __FILE__)

Gem::Specification.new do |s|
  s.name         = 'litchi-fm'
  s.version      = LitchiFm::VERSION
  s.date         = '2018-01-08'
  s.summary      = "Download mp3 from Lizhi.fm"
  s.description  = "Comamnd line tool to download your favourite mp3 from lizhi.fm."
  s.authors      = ["Daniel Han"]
  s.email        = 'hex0cter@gmail.com'
  s.required_ruby_version = '>= 2.1.0'

  s.add_dependency "rest-client", "~> 2.0"

  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path = 'lib'
  s.homepage     = 'http://rubygems.org/gems/litchi-fm'
  s.license      = 'MIT'
end
