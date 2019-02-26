module SplashPayments
  module Exceptions
    autoload :Base, 'splash_payments/exceptions/base'
    autoload :ApiError, 'splash_payments/exceptions/api_error'
    autoload :Connection, 'splash_payments/exceptions/connection'
    autoload :InvalidRequest, 'splash_payments/exceptions/invalid_request'
    autoload :InvalidResponse, 'splash_payments/exceptions/invalid_response'
  end
end

