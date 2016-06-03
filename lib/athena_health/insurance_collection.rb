module AthenaHealth
  class InsuranceCollection < BaseCollection
    attribute :insurances, Array[Insurance]
  end
end
