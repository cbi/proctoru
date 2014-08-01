require 'httparty'
require 'time'

require 'proctoru/configuration'

module Proctoru

  def self.timestamp
    Time.now.utc.iso8601
  end

  class << self
    api_methods = %w( getTimeZoneList getEmailExist getScheduleInfoAvailableTimesList addAdHocProcess pendingExamReport autoLogin beginReservation getTOS agreeToTOS removeReservation moveReservation )
    api_methods.each do |method|
      define_method(method) do |options = {}|

        options[:time_sent] = timestamp
        url = "#{Proctoru.configuration.api_url}#{method}"
        response = HTTParty.post(url, :headers => { "Authorization-Token" => Proctoru.configuration.api_key}, :body => options)

      end
    end
  end

end
