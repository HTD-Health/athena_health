module AthenaHealth
  class AppointmentCollection < BaseCollection
    attribute :appointments, Array[Appointment]
  end
end
