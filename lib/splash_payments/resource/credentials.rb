module SplashPayments
  module Resource
    class Credentials < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'credentials'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entity, :name, :description, :username, :password, 
               :connectUsername, :connectPassword, :integration, :type, :inactive, 
               :frozen]

      attr_accessor *ATTRS

    end
  end
end
