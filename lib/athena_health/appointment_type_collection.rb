module AthenaHealth
  class AppointmentTypeCollection < BaseCollection
    attribute :appointmenttypes, Array[AppointmentType]

    alias_method :appointment_types, :appointmenttypes
  end
end
