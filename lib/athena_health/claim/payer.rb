# frozen_string_literal: true

module AthenaHealth
  module Claim
    class Payer < BaseModel
      attribute :patientinsuranceid, Integer
      attribute :status, String
      attribute :chargeamount, String
      attribute :note, String

      def initialize(args)
        self.patientinsuranceid = args['primarypatientinsuranceid'] || args['secondarypatientinsuranceid']
        super(args)
      end
    end
  end
end
