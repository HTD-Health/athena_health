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
    attribute :patientappointmenttypename, Integer
  end
end
