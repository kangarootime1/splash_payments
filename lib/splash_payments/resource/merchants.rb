module SplashPayments
  module Resource
    class Merchants < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'merchants'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :lastActivity, :entity, :dba, :new, :established, 
               :annualCCSales, :avgTicket, :amex, :discover, :mcc, 
               :status, :boarded, :tcDate, :inactive, :frozen, 
               :environment]

      attr_accessor *ATTRS

    end
  end
end
