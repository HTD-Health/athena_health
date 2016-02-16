module AthenaHealth
  class BaseCollection
    include Virtus.model

    attribute :totalcount, Integer
    attribute :next,       String
    attribute :previous,   String
  end
end
