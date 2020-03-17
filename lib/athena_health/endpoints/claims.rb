# frozen_string_literal: true

module AthenaHealth
  module Endpoints
    module Claims
      def find_claim(practice_id:, claim_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/claims/#{claim_id}",
          method: :get,
          params: params
        )

        Claim::Claim.new(response)
      end
    end
  end
end
