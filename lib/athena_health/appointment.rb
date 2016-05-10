module AthenaHealth
  class Appointment < BaseModel
    attribute :date,                       String
    attribute :appointmentid,              Integer
    attribute :departmentid,               Integer
    attribute :appointmenttype,            String
    attribute :appointmentstatus,          String
    attribute :patientid,                  Integer
    attribute :providerid,                 Integer
    attribute :starttime,                  String
    attribute :duration,                   Integer
    attribute :appointmenttypeid,          Integer
    attribute :patientappointmenttypename, String
    attribute :lastmodified,               String
    attribute :scheduleddatetime,          String
    attribute :scheduledby,                String
    attribute :templateappointmentid,      Integer
    attribute :encounterstatus,            String

    def appointment_status
        {
          'f' => 'Future',
          'x' => 'Cancelled',
          'o' => 'Open',
          '2' => 'Checked in',
          '3' => 'Checked out',
          '4' => 'Charge entered'
        }[appointmentstatus]
    end

    def full_time
      appointment_time = "#{date} #{starttime}"
      DateTime.strptime(appointment_time, '%m/%d/%Y %H:%M')
    end
  end
end
