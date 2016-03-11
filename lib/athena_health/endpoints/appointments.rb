module AthenaHealth
  module Endpoints
    module Appointments
      def all_appointment_types(practice_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointmenttypes",
          method: :get,
          params: params
        )

        AppointmentTypeCollection.new(response)
      end

      def open_appointment_slots(practice_id:, department_id:, provider_id:, reason_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/open",
          method: :get,
          params: params.merge(
            departmentid: department_id,
            providerid: provider_id,
            reasonid: reason_id
          )
        )

        AppointmentCollection.new(response)
      end

      def book_appointment(practice_id:, appointment_id:, patient_id:, appointment_type_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/#{appointment_id}",
          method: :put,
          params: params.merge(patientid: patient_id, appointmenttypeid: appointment_type_id)
        )

        Appointment.new(response.first)
      end

      def all_patient_appointment_reasons(practice_id:, department_id:, provider_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/patientappointmentreasons",
          method: :get,
          params: params.merge!(departmentid: department_id, providerid: provider_id)
        )

        PatientAppointmentReasonCollection.new(response)
      end
    end
  end
end
