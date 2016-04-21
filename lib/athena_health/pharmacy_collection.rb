module AthenaHealth
  class PharmacyCollection < BaseCollection
    attribute :pharmacies, Array[Pharmacy]
  end
end
