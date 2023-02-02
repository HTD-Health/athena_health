# frozen_string_literal: true

require_relative 'diagnosis'
require_relative 'payer'
require_relative 'procedure'
require_relative 'claim_collection'
module AthenaHealth
  module Claim
    class Claim < BaseModel
      attribute :diagnoses, Array[Diagnosis]
      attribute :primaryinsurancepayer, Payer
      attribute :patientpayer, Payer
      attribute :claimcreatedate, String
      attribute :billedproviderid, Integer
      attribute :billedservicedate, String
      attribute :appointmentid, Integer
      attribute :patientid, Integer
      attribute :departmentid, Integer
      attribute :customfields, Array[CustomFieldData]
      attribute :reserved19, String
      attribute :referringproviderid, Integer
      attribute :procedures, Array[Procedure]
      attribute :referralauthid, Integer
      attribute :secondaryinsurancepayer, Payer
      attribute :chargeamount, String
      attribute :transactiondetails, Hash
      attribute :claimid, Integer
      attribute :transactionid, Integer
    end
  end
end
