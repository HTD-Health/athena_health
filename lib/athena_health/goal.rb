# frozen_string_literal: true

module AthenaHealth
  class Goal < BaseModel
    attribute :duration,            String
    attribute :goaltype,            String
    attribute :isprimarygoal,       String
    attribute :name,                String
    attribute :status,              String
    attribute :targetvalue,         String
  end
end
