module AthenaHealth
  class PatientCollection < BaseCollection
    attribute :patients, Array[Patient]
  end
end
