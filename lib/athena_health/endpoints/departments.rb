module AthenaHealth
  module Endpoints
    module Departments
      def all_departments(practice_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/departments",
          method: :get,
          params: params
        )

        DepartmentCollection.new(response)
      end

      def find_department(practice_id:, department_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/departments/#{department_id}",
          method: :get,
          params: params
        )

        Department.new(response.first)
      end
    end
  end
end
