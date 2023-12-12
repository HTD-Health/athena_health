# frozen_string_literal: true

module AthenaHealth
  class TopicOfDiscussion < BaseModel
    attribute :clinicalencounternotetopicid,            Integer
    attribute :declined,                                String
    attribute :declinedreason,                          String
    attribute :encounterid,                             Integer
    attribute :lastmodifiedby,                          String
    attribute :lastmodifieddatetime,                    String
    attribute :sectionid,                               Integer
    attribute :sectionname,                             String
    attribute :topicid,                                 Integer
    attribute :topicname,                               String
    attribute :versiontoken,                            String
  end
end
