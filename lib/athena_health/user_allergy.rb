module AthenaHealth
  class UserAllergy < BaseModel
    attribute :allergenname, String
    attribute :allergenid,   Integer
    attribute :onsetdate,    String
    attribute :note,         String
    attribute :reactions,    Array[Reaction]
  end
end
