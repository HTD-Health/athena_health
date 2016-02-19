module AthenaHealth
  class Event < BaseModel
    attribute :source,    String
    attribute :eventtype, String
    attribute :startdate, String
    attribute :diagnoses, Array
  end
end
