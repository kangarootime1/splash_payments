module SplashPayments
  module Resource
    class AggregationResultGroups < Base

      include Mixin::UpdateDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'aggregationResultGroups'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :aggregation, :resource, :search, :totals, :lastModified]

      attr_accessor *ATTRS

    end
  end
end
