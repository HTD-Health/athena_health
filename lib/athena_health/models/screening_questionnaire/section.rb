# frozen_string_literal: true

module AthenaHealth
  module ScreeningQuestionaire
    # The section of a screening questionaire
    class Section < BaseModel
      attribute :headertext, String
      model_attribute(field_name: 'questionlist', klass: Question, array: true)
    end
  end
end
