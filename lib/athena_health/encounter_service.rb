module AthenaHealth
  class EncounterService < BaseModel
    attribute :count,              Integer
    attribute :note,               String
    attribute :procedures,         Array[Hash]
  end
end
