module AthenaHealth
  class InsurancePackageCollection < BaseCollection
    attribute :insurancepackages, Array[InsurancePackage]
  end
end
