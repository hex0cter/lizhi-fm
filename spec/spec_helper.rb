require "bundler"
Bundler.setup

require "rspec"
require 'rspec/matcher'

require "litchi-fm"

RSpec.configure do |config|
  #config.include NewGem::Spec::Matchers
end
