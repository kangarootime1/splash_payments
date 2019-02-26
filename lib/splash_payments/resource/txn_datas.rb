module SplashPayments
  module Resource
    class TxnDatas < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'txnDatas'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :txn, :signature]

      attr_accessor *ATTRS

    end
  end
end
