module AthenaHealth
  class PrescriptionCollection < BaseCollection
    attribute :prescriptions, Array[Prescription]
  end
end
