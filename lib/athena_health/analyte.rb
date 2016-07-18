module AthenaHealth
  class Analyte < BaseModel
    attribute :analyteid,      Integer
    attribute :analytename,    String
    attribute :loinc,          String
    attribute :value,          String
    attribute :units,          String
    attribute :analytedate,    String
    attribute :description,    String
    attribute :note,           String
    attribute :valuestatus,    String
    attribute :referencerange, String
    attribute :resultstatus,   String
    attribute :abnormalflag,   String
  end
end
