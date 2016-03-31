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

      def create_patient_problem(practice_id:, department_id:, patient_id:, snomed_code:, params: {})
        @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/problems",
          method: :post,
          body: params.merge!(departmentid: department_id, snomedcode: snomed_code)
        )
      end

      def find_patient_problems(practice_id:, department_id:, patient_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/problems",
          method: :get,
          params: { departmentid: department_id }
        )

        PatientProblemCollection.new(response)
      end

      def patient_encounters(practice_id:, department_id:, patient_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/encounters",
          method: :get,
          params: { departmentid: department_id }
        )

        EncounterCollection.new(response)
      end

      def patient_lab_results(practice_id:, department_id:, patient_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/labresults",
          method: :get,
          params: { departmentid: department_id }
        )

        LabResultCollection.new(response)
      end

      def patient_medical_history(practice_id:, department_id:, patient_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/labresults",
          method: :get,
          params: { departmentid: department_id }
        )

        QuestionCollection.new(response)
      end
    end
  end
end
