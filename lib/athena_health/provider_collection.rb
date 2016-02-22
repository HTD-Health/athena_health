module AthenaHealth
  class ProviderCollection < BaseCollection
    attribute :providers, Array[Provider]
  end
end
