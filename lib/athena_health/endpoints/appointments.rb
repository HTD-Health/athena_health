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

      def open_appointment_slots(practice_id:, department_id:, appointment_type_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/appointments/open",
          method: :get,
          params: params.merge(departmentid: department_id, appointmenttypeid: appointment_type_id)
        )

        AppointmentCollection.new(response)
      end
    end
  end
end
