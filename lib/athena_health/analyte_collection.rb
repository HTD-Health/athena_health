module AthenaHealth
  class AnalyteCollection < BaseCollection
    attribute :analytes, Array[Analyte]
  end
end
