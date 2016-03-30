module AthenaHealth
  class OrderCollection < BaseCollection
    attribute :orders,          Array[Order]
    attribute :diagnosis,       String
    attribute :diagnosissnomed, String
  end
end
