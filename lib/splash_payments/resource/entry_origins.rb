module SplashPayments
  module Resource
    class EntryOrigins < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'entryOrigins'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entry, :txn, :disbursement, :adjustment, :cancellation, 
               :amount]

      attr_accessor *ATTRS

    end
  end
end
