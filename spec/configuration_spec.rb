require 'spec_helper'

describe Proctoru do
  it 'defaults api_url' do
    expect(Proctoru.configuration.api_url).to eq "https://apitest.proctoru.com/"
  end

  it 'sets configuration variables' do
    Proctoru.configure do |config|
      config.api_key = "apikey"
      config.api_url = "http://www.proctoru.com"
    end

    expect(Proctoru.configuration.api_key).to eq "apikey"
    expect(Proctoru.configuration.api_url).to eq "http://www.proctoru.com"
  end
end
