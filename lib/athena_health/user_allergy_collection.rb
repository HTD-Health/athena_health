module AthenaHealth
  class UserAllergyCollection < BaseModel
    attribute :lastupdated, String
    attribute :nkda,        Boolean
    attribute :sectionnote, String
    attribute :allergies,   Array[UserAllergy]
  end
end
