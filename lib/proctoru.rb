require 'httparty'
require 'time'

module Proctoru

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_key
    attr_accessor :api_url

    def initialize
      @api_key = ""
      @api_url = "https://apitest.proctoru.com/"
    end
  end

  def self.getTimeZoneList

    time_stamp = Time.now.utc.iso8601
    #auth_token = "api_key"
    #url = "https://apitest.proctoru.com/getTimeZoneList?time_sent=#{time_stamp}"

    #response = HTTParty.get(url, :headers => { "Authorization-Token" => auth_token})

    puts "getTimeZoneList"

  end

end
