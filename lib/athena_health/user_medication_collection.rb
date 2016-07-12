module AthenaHealth
  class UserMedicationCollection < BaseModel
    attribute :lastupdated, String
    attribute :medications, Array[UserMedication]
  end
end
