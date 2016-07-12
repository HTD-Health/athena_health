module AthenaHealth
  class UserMedication < BaseModel
    attribute :source, String
    attribute :orderingmode, String
    attribute :createdby,   String
    attribute :isstructuredsig, Boolean
    attribute :medicationid,  Integer
    attribute :refillsallowed,  Integer
    attribute :route, String
    attribute :encounterid, Integer
    attribute :issafetorenew, Integer
    attribute :medicationentryid, Integer
    attribute :medication, String
    attribute :unstructuredsig, String
    attribute :structuredsig, UserMedicationSig
    attribute :events, Array[UserMedicationEvent]
  end
end
