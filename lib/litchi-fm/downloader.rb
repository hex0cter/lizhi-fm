require 'yaml'
require 'rest-client'

module LitchiFm
  class Downloader
    def initialize(resource_file)
      @config = YAML::load(File.open(resource_file))
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
          end
        end
      end
      threads.each { |thr| thr.join }

      {failures: failures, successes: successes}
    end
  end
end
