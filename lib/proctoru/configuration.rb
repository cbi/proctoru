class Configuration
  attr_accessor :api_key
  attr_accessor :api_url

  def initialize
    @api_key = ""
    @api_url = "https://apitest.proctoru.com/"
  end
end
