module AthenaHealth
  class Practice < BaseModel
    attribute :hascommunicator,       Boolean
    attribute :iscoordinatorsender,   Boolean
    attribute :iscoordinatorreceiver, Boolean
    attribute :hasclinicals,          Boolean
    attribute :name,                  String
    attribute :hascollector,          Boolean
    attribute :publicnames,           Array
    attribute :practiceid,            Integer
  end
end
