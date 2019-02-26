module SplashPayments
  module Resource
    class Plans < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'plans'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :merchant, :name, :description, :schedule, :scheduleFactor, 
               :amount, :inactive, :frozen, :maxFailures, :type]

      attr_accessor *ATTRS

    end
  end
end
