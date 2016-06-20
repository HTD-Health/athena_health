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

      def patient_encounters(practice_id:, department_id:, patient_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/encounters",
          method: :get,
          params: params.merge!(departmentid: department_id)
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
          endpoint: "#{practice_id}/chart/#{patient_id}/medicalhistory",
          method: :get,
          params: { departmentid: department_id }
        )

        QuestionCollection.new(response)
      end

      def update_patient_medical_history(practice_id:, department_id:, patient_id:, questions:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/medicalhistory",
          method: :put,
          params: { departmentid: department_id, questions: questions.to_json }
        )
      end

      def patient_prescriptions(practice_id:, department_id:, patient_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/patients/#{patient_id}/documents/prescription",
          method: :get,
          params: params.merge!(departmentid: department_id)
        )

        PrescriptionCollection.new(response)
      end

      def patient_analytes(practice_id:, department_id:, patient_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/analytes",
          method: :get,
          params: params.merge!(departmentid: department_id)
        )

        AnalyteCollection.new(response)
      end

      def patient_appointments(practice_id:, patient_id:, params: {})
          response = @api.call(
            endpoint: "#{practice_id}/patients/#{patient_id}/appointments",
            method: :get,
            params: params
          )

          AppointmentCollection.new(response)
      end

      def patient_documents(practice_id:, department_id:, patient_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/patients/#{patient_id}/documents",
          method: :get,
          params: params.merge!(departmentid: department_id)
        )

        DocumentCollection.new(response)
      end

      def create_patient_document(practice_id:, department_id:, patient_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/patients/#{patient_id}/documents",
          method: :post,
          body: params.merge!(departmentid: department_id.to_s)
        )
      end

      def patient_default_pharmacy(practice_id:, department_id:, patient_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/pharmacies/default",
          method: :get,
          params: { departmentid: department_id }
        )

        Pharmacy.new(response)
      end

      def set_patient_default_pharmacy(practice_id:, department_id:, patient_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/pharmacies/default",
          method: :put,
          params: params.merge!(departmentid: department_id)
        )
      end

      def patient_preferred_pharmacies(practice_id:, department_id:, patient_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/pharmacies/preferred",
          method: :get,
          params: params.merge!(departmentid: department_id)
        )

        PharmacyCollection.new(response)
      end

      def add_patient_preferred_pharmacy(practice_id:, department_id:, patient_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/pharmacies/preferred",
          method: :put,
          params: params.merge!(departmentid: department_id)
        )
      end

      def patient_default_laboratory(practice_id:, department_id:, patient_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/labs/default",
          method: :get,
          params: { departmentid: department_id }
        )

        Laboratory.new(response)
      end

      def set_patient_default_laboratory(practice_id:, department_id:, patient_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/labs/default",
          method: :put,
          params: params.merge!(departmentid: department_id)
        )
      end

      def patient_social_history_templates(practice_id:, department_id:, patient_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/socialhistory/templates",
          method: :get,
          params: { departmentid: department_id }
        )

        response.map {|template| AthenaHealth::Template.new(template) }
      end

      def set_patient_social_history_templates(practice_id:, department_id:, patient_id:, template_ids: [])
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/socialhistory/templates",
          method: :put,
          params: { departmentid: department_id, templateids: template_ids.join(', ') }
        )
      end

      def update_patient_social_history(practice_id:, department_id:, patient_id:, questions:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/socialhistory",
          method: :put,
          params: { departmentid: department_id, questions: questions.to_json }
        )
      end

      def patient_social_history(practice_id:, department_id:, patient_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/socialhistory",
          method: :get,
          params: params.merge!(departmentid: department_id)
        )

        SocialHistory.new(response)
      end

      def add_patient_medication(practice_id:, department_id:, patient_id:, medication_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/medications",
          method: :post,
          body: params.merge!(departmentid: department_id, medicationid: medication_id)
        )
      end

      def update_patient_allergies(practice_id:, department_id:, patient_id:, allergies:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/allergies",
          method: :put,
          params: { departmentid: department_id, allergies: allergies.to_json }
        )
      end

      def verify_patient_privacy_information(practice_id:, department_id:, patient_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/patients/#{patient_id}/privacyinformationverified",
          method: :post,
          body: params.merge!(departmentid: department_id.to_s)
        )
      end

      def create_patient_insurance(practice_id:, patient_id:, insurance_package_id:, sequence_number:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/patients/#{patient_id}/insurances",
          method: :post,
          body: params.merge!(insurancepackageid: insurance_package_id, sequencenumber: sequence_number)
        )
      end

      def record_payment(practice_id:, department_id:, patient_id:, payment_method:, amount:, params: {})
        @api.call(
          endpoint: "#{practice_id}/patients/#{patient_id}/recordpayment",
          method: :post,
          body: params.merge!(
            departmentid: department_id.to_s,
            paymentmethod: payment_method,
            copayamount: amount
          )
        )
      end

      def patient_insurances(practice_id:, patient_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/patients/#{patient_id}/insurances",
          method: :get,
          params: params
        )

        InsuranceCollection.new(response)
      end
    end
  end
end
