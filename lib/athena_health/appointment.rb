module AthenaHealth
  class Appointment < BaseModel
    attribute :date,                       String
    attribute :appointmentid,              Integer
    attribute :departmentid,               Integer
    attribute :appointmenttype,            String
    attribute :providerid,                 Integer
    attribute :starttime,                  String
    attribute :duration,                   Integer
    attribute :appointmenttypeid,          Integer
    attribute :patientappointmenttypename, Integer
  end
end
