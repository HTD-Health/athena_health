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

      def find_appointment_type(practice_id:, appointment_type_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointmenttypes/#{appointment_type_id}",
          method: :get,
          params: params
        )

        AppointmentType.new(response.first)
      end

      def open_appointment_slots(practice_id:, department_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/open",
          method: :get,
          params: params.merge(
            departmentid: department_id
          )
        )

        AppointmentCollection.new(response)
      end

      def create_appointment_slot(practice_id:, department_id:, appointment_date:, appointment_time:, provider_id:, body: {})
        @api.call(
          endpoint: "#{practice_id}/appointments/open",
          method: :post,
          body: body.merge(
            departmentid: department_id,
            appointmentdate: appointment_date,
            appointmenttime: appointment_time,
            providerid: provider_id
          )
        )
      end

      def book_appointment(practice_id:, appointment_id:, patient_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/#{appointment_id}",
          method: :put,
          params: params.merge(patientid: patient_id)
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

      def booked_appointments(practice_id:, department_id:, start_date:, end_date:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/booked",
          method: :get,
          params: params.merge!(
            departmentid: department_id,
            startdate: start_date,
            enddate: end_date
          )
        )

        AppointmentCollection.new(response)
      end

      def multipledepartment_booked_appointments(practice_id:, department_id:, start_date:, end_date:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/booked/multipledepartment",
          method: :get,
          params: params.merge!(
            departmentid: department_id,
            startdate: start_date,
            enddate: end_date
          )
        )

        AppointmentCollection.new(response)
      end

      def cancel_appointment(practice_id:, appointment_id:, patient_id:, body: {})
        @api.call(
          endpoint: "#{practice_id}/appointments/#{appointment_id}/cancel",
          method: :put,
          body: body.merge!(patientid: patient_id)
        )
      end

      def appointment_notes(practice_id:, appointment_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/#{appointment_id}/notes",
          method: :get,
          params: params
        )

        NoteCollection.new(response)
      end

      def create_appointment_note(practice_id:, appointment_id:, note_text:)
        @api.call(
          endpoint: "#{practice_id}/appointments/#{appointment_id}/notes",
          method: :post,
          body: { notetext: note_text }
        )
      end

      def start_check_in(practice_id:, appointment_id:)
        @api.call(
          endpoint: "#{practice_id}/appointments/#{appointment_id}/startcheckin",
          method: :post
        )
      end

      def cancel_check_in(practice_id:, appointment_id:)
        @api.call(
          endpoint: "#{practice_id}/appointments/#{appointment_id}/cancelcheckin",
          method: :post
        )
      end

      def check_in(practice_id:, appointment_id:)
        @api.call(
          endpoint: "#{practice_id}/appointments/#{appointment_id}/checkin",
          method: :post
        )
      end

      def reschedule_appointment(practice_id:, patient_id:, appointment_id:, new_appointment_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/#{appointment_id}/reschedule",
          method: :put,
          params: params.merge!(
            patientid: patient_id,
            newappointmentid: new_appointment_id
          )
        )

        Appointment.new(response.first)
      end

      def find_appointment(practice_id:, appointment_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/#{appointment_id}",
          method: :get,
          params: params
        )

        Appointment.new(response.first)
      end


      def appointment_reminders(practice_id:, start_date:, end_date:, department_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/appointmentreminders",
          method: :get,
          params: params.merge!(
            startdate: start_date,
            enddate: end_date,
            departmentid: department_id
          )
        )

        AppointmentReminderCollection.new(response)
      end

      def find_appointment_reminder(practice_id:, appointment_reminder_id:)
        response = @api.call(
          endpoint: "#{practice_id}/appointments/appointmentreminders/#{appointment_reminder_id}",
          method: :get
        )

        AppointmentReminder.new(response)
      end

      def create_appointment_reminder(practice_id:, approximate_date:, department_id:, patient_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/appointments/appointmentreminders",
          method: :post,
          body: params.merge!(
            approximatedate: approximate_date,
            departmentid: department_id,
            patientid: patient_id
          )
        )
      end

      def delete_appointment_reminder(practice_id:, appointment_reminder_id:)
        @api.call(
          endpoint: "#{practice_id}/appointments/appointmentreminders/#{appointment_reminder_id}",
          method: :delete
        )
      end

      def appointment_insurances(practice_id:, appointment_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/#{appointment_id}/insurances",
          method: :get,
          params: params
        )

        InsuranceCollection.new(response)
      end

      def create_appointment_subscription(practice_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/appointments/changed/subscription",
          method: :post,
          params: params
        )
      end

      def changed_appointments(practice_id:, department_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/changed",
          method: :get,
          params: params.merge!(
            departmentid: department_id
          )
        )

        AppointmentCollection.new(response)
      end

      def create_appointment_waitlist(practice_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/appointments/waitlist",
          method: :post,
          body: params
        )
      end
    end
  end
end
