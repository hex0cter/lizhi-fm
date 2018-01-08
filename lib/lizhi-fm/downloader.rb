require 'yaml'
require 'rest-client'

module LizhiFm
  class Downloader
    def initialize(resource)
      raise "File '#{resource}' doesn't exist!" unless File.exist?(resource)

      @config = YAML::load(File.open(resource))
      raise "Invalid yaml file: '#{resource}'" unless @config

      if @config['headers'].nil?
        raise "Invalid format: missing 'headers' section in '#{resource}'"
      end

      if @config['resources'].nil?
        raise "Invalid format: missing 'resources' section in '#{resource}'"
      end
    end

    def start
      headers =  @config['headers']

      failures = []
      successes = {}

      threads = []
      @config['resources'].each do |resource|
        destination = resource['name']
        url = resource['url']

        threads << Thread.new do
          response = RestClient.get(url, headers=headers)
          if response.code == 200
            file_name = File.join(Dir.pwd, destination)
            File.write(file_name, response.body)
            successes[url] = file_name
          else
            failures << url
            puts "Unable to download #{url}"
          end
          print '.'
        end
      end
      threads.each { |thr| thr.join }

      {failures: failures, successes: successes}
    end
  end
end
