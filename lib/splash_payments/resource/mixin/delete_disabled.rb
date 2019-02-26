module SplashPayments
  module Resource
    module Mixin
      module DeleteDisabled
        def delete(params = {})
          raise SplashPayments::Exceptions::InvalidRequest.new('Invalid Action')
        end
      end
    end
  end
end
