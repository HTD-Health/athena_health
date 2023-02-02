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
        orders_collection = []
        response.each { |x| orders_collection << OrderCollection.new(x) }

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
          endpoint: "#{practice_id}/chart/encounters/#{encounter_id}/summary",
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

      def encounter_screening_questionnaires(practice_id:, encounter_id:, limit: nil, offset: nil)
        params = {
          limit: limit, offset: offset
        }.reject { |_k, value| value.nil? }

        response = @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/questionnairescreeners",
          params: params,
          method: :get
        )

        ScreeningQuestionaire::ScreeningQuestionaireCollection.new(response)
      end

      def activate_screening_questionnaire(practice_id:, encounter_id:, template_id:)
        @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/questionnairescreeners",
          body: {
            templateid: template_id
          },
          method: :post
        )
      end

      def update_screening_questionnaire_score_only(
        practice_id:,
        encounter_id:,
        questionnaire_id:,
        score:,
        document_ids:,
        note: nil
      )

        body = {
          questionnaireid: questionnaire_id,
          documentids: document_ids,
          score: score, note: note
        }.reject { |_k, value| value.nil? }

        @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/questionnairescreeners/scoreonly",
          body: body,
          method: :put
        )
      end

      def update_screening_questionnaire(
        practice_id:,
        encounter_id:,
        questionnaire_id:,
        questions:,
        score:,
        document_ids:,
        guidelines: nil,
        state: nil,
        note: nil
      )

        body = {
          questionnaireid: questionnaire_id,
          documentids: document_ids, guidelines: guidelines,
          state: state, questions: questions, score: score, note: note
        }.reject { |_k, value| value.nil? }

        @api.call(
          endpoint: "#{practice_id}/chart/encounter/#{encounter_id}/questionnairescreeners",
          body: body,
          method: :put
        )
      end
    end
  end
end
