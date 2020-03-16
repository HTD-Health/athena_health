# frozen_string_literal: true

module AthenaHealth
  module Claim
    class Procedure < BaseModel
      attribute :transactionid, Integer
      attribute :allowableamount, String
      attribute :procedurecategory, String
      attribute :allowablemin, String
      attribute :proceduredescription, String
      attribute :chargeamount, String
      attribute :procedurecode, String
      attribute :allowablemax, String
    end
  end
end
