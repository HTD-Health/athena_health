module AthenaHealth
  class LabResultCollection < BaseCollection
    attribute :results, Array[LabResult]
  end
end
