module SplashPayments
  module Resource
    class Teams < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'teams'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :name, :description, :autoCascadeDisabled, :inactive, 
               :frozen]

      attr_accessor *ATTRS

    end
  end
end
