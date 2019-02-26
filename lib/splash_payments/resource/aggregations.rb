module SplashPayments
  module Resource
    class Aggregations < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'aggregations'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :name, :description, :resource, :search, 
               :totals, :status, :schedule, :scheduleFactor, :start, 
               :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
