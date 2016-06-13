module AthenaHealth
  class AppointmentReminderCollection < BaseCollection
    attribute :reminders, Array[AppointmentReminder]
  end
end
