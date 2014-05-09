require 'httparty'
require 'time'

require 'proctoru/configuration'

module Proctoru

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.getTimeZoneList

    time_stamp = Time.now.utc.iso8601
    url = "#{Proctoru.configuration.api_url}getTimeZoneList?time_sent=#{time_stamp}"
    response = HTTParty.get(url, :headers => { "Authorization-Token" => Proctoru.configuration.api_key})

  end

end
