require_relative 'base_model'
module AthenaHealth
  class BaseCollection < BaseModel
    include Virtus.model

    attribute :totalcount, Integer
    attribute :next,       String
    attribute :previous,   String
  end
end
