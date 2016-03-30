module AthenaHealth
  class Encounter < BaseModel
    attribute :encountertype,      String
    attribute :patientstatusid,    Integer
    attribute :stage,              String
    attribute :status,             String
    attribute :appointmentid,      Integer
    attribute :patientlocationid,  Integer
    attribute :encounterdate,      String
    attribute :encountervisitname, String
    attribute :patientlocation,    String
    attribute :encounterid,        Integer
    attribute :lastupdated,        String
    attribute :patientstatus,      String
  end
end
