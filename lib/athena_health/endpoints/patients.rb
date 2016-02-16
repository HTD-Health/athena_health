module AthenaHealth
  module Endpoints
    module Patients
      def all_patients(practice_id:, department_id:, params: {})
        response = @api.call(endpoint: "#{practice_id}/patients", method: :get, params: params.merge!(departmentid: department_id))
        PatientCollection.new(response)
      end
    end
  end
end
