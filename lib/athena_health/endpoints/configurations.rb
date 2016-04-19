module AthenaHealth
  module Endpoints
    module Configurations
      def all_facilities(practice_id:, department_id:, order_type:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/chart/configuration/facilities",
          method: :get,
          params: params.merge!(departmentid: department_id, ordertype: order_type)
        )

        response.map {|facility| AthenaHealth::Facility.new(facility) }
      end
    end
  end
end
