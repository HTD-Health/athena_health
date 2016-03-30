module AthenaHealth
  module Endpoints
    module Encounters
      def find_encounter(practice_id:, encounter_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}",
          method: :get
        )

        Encounter.new(response.first)
      end

      def encounter_orders(practice_id:, encounter_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/orders",
          method: :get
        )

        OrderCollection.new(response.first)
      end
    end
  end
end
