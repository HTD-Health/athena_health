module AthenaHealth
  class AppointmentWaitlist < BaseModel
    attribute :allowanydepartment,  Boolean
    attribute :appointmentid,       Integer
    attribute :appointmenttypeid,   Integer
    attribute :created,             String
    attribute :dayofweekids,        Array
    attribute :departmentid,        Integer
    attribute :hourfrom,            Integer
    attribute :hourto,              Integer
    attribute :note,                String
    attribute :patientid,           Integer
    attribute :priority,            String
    attribute :providerid,          Integer
    attribute :waitlistid,          Integer
  end
end
