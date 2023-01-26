# frozen_string_literal: true

module AthenaHealth
  module ScreeningQuestionaire
    # A specfic question in a screening questionaire
    class Question < BaseModel
      attribute :answer, String
      attribute :hidden, String
      attribute :key, String
      attribute :possibleanswers, Array[String]
      attribute :question, String
      attribute :questionid, Integer
    end
  end
end
