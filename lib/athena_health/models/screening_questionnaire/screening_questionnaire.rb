# frozen_string_literal: true

require_relative 'question'
require_relative 'meta_question'
require_relative 'section'

module AthenaHealth
  module ScreeningQuestionaire
    # The reason the patient declined
    class DeclinedReason < BaseModel
      attribute :declinedreasontext, String
    end

    # Screening Questionnaires are used to assess risk for or severity of disorders or
    # conditions such as autism and depression. These questionnaires result in a score,
    # and often include guidelines and proposed treatment actions. Screeners can be structured
    # or score-only. The Screening Questionnaires Reference are configured in the system.
    # The user will be able to retrieve the list of screening questionnaires for a specific
    # encounter. Screeners can be structured or score-only.
    class ScreeningQuestionaire < BaseModel
      model_attribute(field_name: 'declinedreason', klass: DeclinedReason)
      attribute :documentids, Array[String]
      attribute :guidelines, String
      attribute :maximumscore, Integer
      model_attribute(field_name: 'metaquestions', klass: MetaQuestion, array: true)
      attribute :name, String
      attribute :note, String
      attribute :questionnaireid, Integer
      attribute :score, Integer
      attribute :scoredby, String
      attribute :scoreddate, String
      attribute :scoringstatus, String
      model_attribute(field_name: 'sections', klass: Section, array: true)
      attribute :templateid, Integer
      attribute :templatetype, String
    end
  end
end
