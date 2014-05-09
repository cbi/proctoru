module Proctoru
  class Configuration
    attr_accessor :api_key
    attr_accessor :api_url

    def initialize
      @api_key = ""
      @api_url = "https://apitest.proctoru.com/"
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

end
