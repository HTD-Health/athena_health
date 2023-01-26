# frozen_string_literal: true

module AthenaHealth
  module ScreeningQuestionaire
    # Any meta questions related to a questionnaire.
    # E.g., should this be considered generally as positive or negative?
    class MetaQuestion < BaseModel
      attribute :answertext, String
      attribute :questiontext, String
    end
  end
end
