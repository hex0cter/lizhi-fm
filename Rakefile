require "bundler"

Bundler.setup

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

require_relative 'lib/version'

desc "Build the gem"
task :build do
  sh %{ gem build lizhi-fm.gemspec }
end

desc "Install the gem"
task :install do
  sh %{ gem install lizhi-fm-#{LizhiFm::VERSION}.gem }
end

task :default => ['spec']
