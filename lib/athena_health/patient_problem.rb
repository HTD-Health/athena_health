module AthenaHealth
  class PatientProblem < BaseModel
    attribute :problemid, Integer
    attribute :events,    Array[Event]
    attribute :codeset,   String
    attribute :name,      String
    attribute :code,      Integer
  end
end
