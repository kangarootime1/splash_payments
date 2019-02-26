module SplashPayments
  module Resource
    class Tokens < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'tokens'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :customer, :payment, :token, :expiration, :inactive, 
               :frozen, :name, :description, :custom]

      attr_accessor *ATTRS

    end
  end
end
