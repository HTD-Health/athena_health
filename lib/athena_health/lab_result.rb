module AthenaHealth
  class LabResult < BaseModel
    attribute :labresultdate,      String
    attribute :labresultnote,      String
    attribute :labresultid,        Integer
    attribute :analytes,           Array
    attribute :description,        String
  end
end
