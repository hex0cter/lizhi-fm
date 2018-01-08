require File.expand_path("../lib/version", __FILE__)

Gem::Specification.new do |s|
  s.name         = 'lizhi-fm'
  s.version      = LizhiFm::VERSION
  s.date         = '2018-01-08'
  s.summary      = "Download mp3 from Lizhi.fm"
  s.description  = "Comamnd line tool to download your favourite mp3 from lizhi.fm."
  s.authors      = ["Daniel Han"]
  s.email        = 'hex0cter@gmail.com'
  s.required_ruby_version = '>= 2.1.0'

  s.add_dependency "rest-client", "~> 2.0"
  s.add_dependency "thor", "~> 0.19"

  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path = 'lib'
  s.executables = ["lizhi"]
  s.homepage     = 'http://rubygems.org/gems/lizhi-fm'
  s.license      = 'MIT'
end
