module AthenaHealth
  class AppointmentReminder < BaseModel
    attribute :appointmentreminderid, Integer
    attribute :providerid,            Integer
    attribute :appointmenttypeid,     Integer
    attribute :approximatedate,       String
    attribute :note,                  String
    attribute :deleted,               String
    attribute :status,                String
    attribute :patientid,             Integer
    attribute :departmentid,          Integer
    attribute :patientinstructions,   String
  end
end
