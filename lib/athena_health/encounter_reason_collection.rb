module AthenaHealth
  class EncounterReasonCollection < BaseCollection
    attribute :encounterreasons,           Array[EncounterReason]
    attribute :encounterreasonnote,        String
    attribute :notelastmodifieddatetime,   String
    attribute :notelastmodifieduser,       String
  end
end
