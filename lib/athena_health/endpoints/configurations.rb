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

      def all_medications(practice_id:, search_value:)
        response = @api.call(
          endpoint: "#{practice_id}/reference/medications",
          method: :get,
          params: { searchvalue: search_value }
        )

        response.map {|medication| AthenaHealth::Medication.new(medication) }
      end

      def all_allergies(practice_id:, search_value:)
        response = @api.call(
          endpoint: "#{practice_id}/reference/allergies",
          method: :get,
          params: { searchvalue: search_value }
        )

        response.map {|allergy| AthenaHealth::Allergy.new(allergy) }
      end
    end
  end
end
