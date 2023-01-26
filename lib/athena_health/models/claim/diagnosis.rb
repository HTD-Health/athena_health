# frozen_string_literal: true

module AthenaHealth
  module Claim
    class Diagnosis < BaseModel
      attribute :diagnosisid,           Integer
      attribute :diagnosiscategory,     String
      attribute :diagnosisrawcode,      String
      attribute :diagnosiscodeset,      String
      attribute :diagnosisdescription,  String
      attribute :deleteddiagnosis,      Boolean
    end
  end
end
