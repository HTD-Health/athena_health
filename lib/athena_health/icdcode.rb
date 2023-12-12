# frozen_string_literal: true

module AthenaHealth
  class Icdcode < BaseModel
    attribute :code,          String
    attribute :codeset,       String
    attribute :description,   String
  end
end
