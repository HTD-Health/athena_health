module AthenaHealth
  class Analyte < BaseModel
    attribute :analyteid,      Integer
    attribute :analytename,    String
    attribute :loinc,          String
    attribute :value,          Integer
    attribute :units,          String
    attribute :analytedate,    String
    attribute :description,    String
    attribute :note,           String
    attribute :valuestatus,    String
    attribute :referencerange, String
  end
end
