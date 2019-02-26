module SplashPayments
  module Resource
    module Mixin
      module UpdateDisabled
        def update(params = {})
          raise SplashPayments::Exceptions::InvalidRequest.new('Invalid Action')
        end
      end
    end
  end
end