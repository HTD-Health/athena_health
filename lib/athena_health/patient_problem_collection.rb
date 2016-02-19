module AthenaHealth
  class PatientProblemCollection < BaseCollection
    attribute :lastupdated, String
    attribute :problems,    Array[PatientProblem]
  end
end
