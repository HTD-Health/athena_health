module AthenaHealth
  class Prescription < BaseModel
    attribute :prescriptionid,       Integer
    attribute :priority,             Integer
    attribute :assignedto,           String
    attribute :documentclass,        String
    attribute :createddatetime,      String
    attribute :documentroute,        String
    attribute :documentsource,       String
    attribute :createddate,          String
    attribute :status,               String
    attribute :documentdescription,  String
    attribute :encounterdate,        String
    attribute :lastmodifieddatetime, String
    attribute :documentsubclass,     String
    attribute :providerid,           Integer
    attribute :encounterid,          Integer
  end
end
