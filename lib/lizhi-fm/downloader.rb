require 'yaml'
require 'digest'
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
      urls = []
      outputs = {}
      @config['resources'].each do |resource|
        destination = resource['name']
        url = resource['url']
        urls << url

        threads << Thread.new do
          outputs[url] = {}

          # The server use 206 during transferring.
          # Sometimes the response are incomplete.
          # We download each file up to 10 times and
          # save it once there are two identical
          # results.
          10.times do
            response = RestClient.get(url, headers=headers)
            md5 = Digest::SHA256.hexdigest response.body

            if response.code != 200
              print '-'
              continue
            end

            if outputs[url].has_key?(md5)
              file_name = File.join(Dir.pwd, destination)
              File.write(file_name, response.body)
              successes[url] = file_name
              print '='
              break
            else
              outputs[url][md5] = response.body
              print '+'
            end
          end
        end
      end
      threads.each { |thr| thr.join }

      urls.each do |url|
        failures << url unless successes.has_key?(url)
      end

      {failures: failures, successes: successes}
    end
  end
end
