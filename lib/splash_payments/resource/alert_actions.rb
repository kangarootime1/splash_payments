module SplashPayments
  module Resource
    class AlertActions < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'alertActions'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :type, :options, :value, :alert, :retries]

      attr_accessor *ATTRS

    end
  end
end
