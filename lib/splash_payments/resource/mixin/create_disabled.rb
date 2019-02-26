module SplashPayments
  module Resource
    module Mixin
      module CreateDisabled
        def create(params = {})
          raise SplashPayments::Exceptions::InvalidRequest.new('Invalid Action')
        end
      end
    end
  end
end
