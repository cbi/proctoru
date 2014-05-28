require 'spec_helper'

describe Proctoru do
  before(:all) do
    Proctoru.configure do |config|
      config.api_key = ENV['AUTH_TOKEN']
      config.api_url = "https://apitest.proctoru.com/"
    end
    @time_stamp = Time.now.utc.iso8601
  end

  its'gets time zones from api' do
    expect(Proctoru.getTimeZoneList.to_s).to include("Central Time Zone")
  end

  it 'gets a list of available times' do
    
    start_date = (Time.now + (60*60*24*7)).utc.iso8601

    options = {
      :time_sent => @time_stamp,
      :student_id => 1,
      :duration => 120,
      :time_zone_id => "CENTRAL STANDARD TIME",
      :start_date => start_date,
      :takeitnow => "F",
      :isadhoc => "T"
    }

    response = Proctoru.getScheduleInfoAvailableTimesList(options)
    expect(response.body).to include("data")

    parsed_response = JSON.parse(response.body)
    expect(parsed_response['response_code']).to eq 1

  end

  it 'schedules an adhoc exam' do
    
    start_date = (Time.now + (60*60*24*7)).utc.iso8601

    # get time slot
    options = {
      :time_sent => @time_stamp,
      :student_id => 1,
      :duration => 120,
      :time_zone_id => "CENTRAL STANDARD TIME",
      :start_date => start_date,
      :takeitnow => "F",
      :isadhoc => "T"
    }

    response = Proctoru.getScheduleInfoAvailableTimesList(options)

    options = {
      :time_sent => @time_stamp,
      :student_id => "j@bitsmail.com",
      :last_name => "Wright",
      :first_name => "Joe",
      :address1 => "123 W Madison St, Suite 1005",
      :city => "Chicago",
      :state => "IL",
      :zipcode => "60603",
      :country => "US",
      :phone1 => "3128493813",
      :email => "j@bitsmail.com",
      :time_zone_id => "CENTRAL STANDARD TIME",
      :description => "Test AdHoc Exam",
      :duration => 120,
      :start_date => response['data'][0]['start_date'],
      :takeitnow => "F",
      :reservation_id => rand(1000..10000),
      :notify => "T"
    }

    response = Proctoru.addAdHocProcess(options)
    expect(response.body).to include("data")

    #binding.pry

    #parsed_response = JSON.parse(response.body)
    #expect(parsed_response['response_code']).to eq 1

  end

end
