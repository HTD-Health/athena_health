# frozen_string_literal: true

require_relative 'screening_questionnaire'
module AthenaHealth
  module ScreeningQuestionaire
    # a collection of screening questionaire templates
    class ScreeningQuestionaireTemplateCollection < BaseCollection
      model_attribute(field_name: 'questionnairescreeners', klass: ScreeningQuestionaireTemplate, array: true)
    end
  end
end
