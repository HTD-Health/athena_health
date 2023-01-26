# frozen_string_literal: true

module AthenaHealth
  module ScreeningQuestionaire
    # a collection of screening questionaires
    class ScreeningQuestionaireCollection < BaseCollection
      attribute :screening_questionnaires, Array[ScreeningQuestionaire]
    end
  end
end
