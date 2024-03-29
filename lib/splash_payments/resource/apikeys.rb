module SplashPayments
  module Resource
    class Apikeys < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'apikeys'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :key, :name, :description, :public, 
               :inactive, :frozen, :effectiveRoles]

      attr_accessor *ATTRS

    end
  end
end
