module AthenaHealth
  module Endpoints
    module Patients
      def all_patients(practice_id:, department_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/patients",
          method: :get,
          params: params.merge!(departmentid: department_id)
        )

        PatientCollection.new(response)
      end

      def find_patient(practice_id:, patient_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/patients/#{patient_id}",
          method: :get,
          params: params
        )

        Patient.new(response.first)
      end

      def create_patient(practice_id:, department_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/patients",
          method: :post,
          body: params.merge!(departmentid: department_id)
        )
      end

      def update_patient(practice_id:, patient_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/patients/#{patient_id}",
          method: :put,
          params: params
        )
      end

      def delete_patient(practice_id:, patient_id:)
        @api.call(
          endpoint: "#{practice_id}/patients/#{patient_id}",
          method: :put,
          params: { status: 'deleted' }
        )
      end
    end
  end
end
