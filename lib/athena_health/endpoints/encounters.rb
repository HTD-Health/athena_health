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

      def encounter_services(practice_id:, encounter_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/encounter/#{encounter_id}/services",
          method: :get
        )

        EncounterService.new(response.first)
      end

      def encounter_orders(practice_id:, encounter_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/orders",
          method: :get
        )
        orders_collection = []
        response.each {|x| orders_collection << OrderCollection.new(x)}

        orders_collection
      end

      def encounter_order(practice_id:, encounter_id:, order_id:)
        response = @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/orders/#{order_id}",
          method: :get
        )

        Order.new(response)
      end

      def encounter_summary(practice_id:, encounter_id:)
        response = @api.call(
          endpoint:  "#{practice_id}/chart/encounters/#{encounter_id}/summary",
          method: :get
        )
        EncounterSummary.new(response)
      end

      def create_encounter_order_lab(practice_id:, encounter_id:, body: {})
        @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/orders/lab",
          method: :post,
          body: body
        )
      end

      def create_order_group(practice_id:, patient_id:, body: {})
        @api.call(
          endpoint: "#{practice_id}/chart/#{patient_id}/ordergroups",
          method: :post,
          body: body
        )
      end

      def create_encounter_diagnoses(practice_id:, encounter_id:, body: {})
        @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/diagnoses",
          method: :post,
          body: body
        )
      end
    end
  end
end
