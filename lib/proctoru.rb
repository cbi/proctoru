require 'httparty'
require 'time'

require 'proctoru/configuration'

module Proctoru

  def self.getTimeZoneList

    time_stamp = Time.now.utc.iso8601
    url = "#{Proctoru.configuration.api_url}getTimeZoneList?time_sent=#{time_stamp}"
    response = HTTParty.get(url, :headers => { "Authorization-Token" => Proctoru.configuration.api_key})

  end

  def self.getScheduleInfoAvailableTimesList

  end

end
