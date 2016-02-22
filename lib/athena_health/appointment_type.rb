module AthenaHealth
  class AppointmentType < BaseModel
    attribute :shortname,          String
    attribute :name,               String
    attribute :duration,           Integer
    attribute :patientdisplayname, String
    attribute :appointmenttypeid,  Integer
    attribute :generic,            Boolean
    attribute :patient,            Boolean
    attribute :publicnames,        Array
    attribute :templatetypeonly,   Boolean
  end
end
