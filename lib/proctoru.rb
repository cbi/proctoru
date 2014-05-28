require 'httparty'
require 'time'

require 'proctoru/configuration'

module Proctoru

  def self.timestamp
    Time.now.utc.iso8601
  end

  def self.getTimeZoneList
    url = "#{Proctoru.configuration.api_url}getTimeZoneList?time_sent=#{timestamp}"
    response = HTTParty.get(url, :headers => { "Authorization-Token" => Proctoru.configuration.api_key})
  end

  def self.getScheduleInfoAvailableTimesList(options)
    options[:time_sent] = timestamp
    
    url = "#{Proctoru.configuration.api_url}getScheduleInfoAvailableTimesList"
    response = HTTParty.post(url, :headers => { "Authorization-Token" => Proctoru.configuration.api_key}, :body => options)
  end

  def self.addAdHocProcess(options)
    options[:time_sent] = timestamp
    
    url = "#{Proctoru.configuration.api_url}addAdHocProcess"
    response = HTTParty.post(url, :headers => { "Authorization-Token" => Proctoru.configuration.api_key}, :body => options)
  end

end
