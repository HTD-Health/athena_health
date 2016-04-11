module AthenaHealth
  class LabResult < BaseModel
    attribute :labresultdate,      String
    attribute :labresultnote,      String
    attribute :labresultid,        Integer
    attribute :analytes,           Array[Analyte]
    attribute :description,        String
  end
end
