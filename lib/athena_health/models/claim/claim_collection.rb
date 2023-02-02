# frozen_string_literal: true

module AthenaHealth
  module Claim
    class ClaimCollection < BaseCollection
      attribute :claims, Array[Claim]
    end
  end
end
