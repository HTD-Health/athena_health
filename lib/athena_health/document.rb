module AthenaHealth
  class Document < BaseModel
    attribute :prescriptionid,       Integer
    attribute :encounterid,          Integer
    attribute :providerid,           Integer
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
    attribute :orderid,              Integer
    attribute :labresultid,          Integer
    attribute :observations,         Array[Analyte]
  end
end
