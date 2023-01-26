# frozen_string_literal: true

module AthenaHealth
  module ScreeningQuestionaire
    # The section of a screening questionaire
    class Section < BaseModel
      attribute :headertext, String
      attribute :questionlist, Array[Question]
    end
  end
end
