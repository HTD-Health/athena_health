module AthenaHealth
  class QuestionCollection < BaseCollection
    attribute :questions, Array[Question]
  end
end
