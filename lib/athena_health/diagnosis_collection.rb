# frozen_string_literal: true
module AthenaHealth
  class DiagnosisCollection < BaseCollection
    attribute :description,           String
    attribute :diagnosisid,           Integer
    attribute :errormessage,           String
    attribute :icdcodes,               Array(Icdcode)
    attribute :laterality,             String
    attribute :note,                   String
    attribute :ranking,                Integer
    attribute :snomedcode,             Integer
    attribute :success,                String
    attribute :supportslaterality,     String
  end
end

