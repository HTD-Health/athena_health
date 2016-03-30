module AthenaHealth
  class EncounterCollection < BaseCollection
    attribute :encounters, Array[Encounter]
  end
end
