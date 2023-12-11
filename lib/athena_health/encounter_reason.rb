module AthenaHealth
  class EncounterReason < BaseModel
    attribute :encounterreasonid,           Integer
    attribute :encounterreasontext,         String
    attribute :lastmodifieddatetime,        String
    attribute :lastmodifieduser,            String
  end
end
