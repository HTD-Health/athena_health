module AthenaHealth
  class PatientAppointmentReason < BaseModel
    attribute :schedulingminhours, Integer
    attribute :reasontype,         String
    attribute :reason,             String
    attribute :description,        String
    attribute :reasonid,           Integer
    attribute :schedulingmaxdays,  Integer
  end
end
