module AthenaHealth
  class Question < BaseModel
    attribute :question,   String
    attribute :answer,     String
    attribute :questionid, Integer
  end
end
