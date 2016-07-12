module AthenaHealth
  class UserMedicationCollection < BaseModel
    attribute :lastupdated, String
    attribute :medications, Array[Array[UserMedication]]
  end
end
