module AthenaHealth
  class UserMedicationSig < BaseModel
    attribute :dosageroute,                  String
    attribute :dosageaction,                 String
    attribute :dosageadditionalinstructions, String
    attribute :dosagefrequencyunit,          String
    attribute :dosagequantityunit,           String
    attribute :dosagequantityvalue,          Integer
    attribute :dosagedurationunit,           String
  end
end
