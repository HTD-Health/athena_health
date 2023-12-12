# frozen_string_literal: true

module AthenaHealth
  class PatientGoal < BaseModel
    attribute :discussionnotes,                String
    attribute :freetextgoal,                   String
    attribute :goals,                          Array(Goal)
    attribute :patientinstructions,            String
    attribute :topicsofdiscussion,             Array(TopicOfDiscussion)
  end
end
