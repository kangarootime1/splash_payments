require "splash_payments/version"
require "splash_payments/configuration"
require "splash_payments/exceptions"
require "splash_payments/http"
require "splash_payments/resource"

module SplashPayments
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
