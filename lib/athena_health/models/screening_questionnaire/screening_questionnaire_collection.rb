# frozen_string_literal: true

require_relative 'screening_questionnaire'
module AthenaHealth
  module ScreeningQuestionaire
    # a collection of screening questionaires
    class ScreeningQuestionaireCollection < BaseModel
      model_attribute(field_name: 'questionnairescreeners', klass: ScreeningQuestionaire, array: true)
    end
  end
end
