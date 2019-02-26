module SplashPayments
  module Resource
    class Disbursements < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'disbursements'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entity, :account, :payout, :description, :amount, 
               :status, :processed, :currency, :payment, :expiration, 
               :sameDay]

      attr_accessor *ATTRS

    end
  end
end
