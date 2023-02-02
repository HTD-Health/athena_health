module AthenaHealth
  module Endpoints
    module Configurations
      def all_facilities(practice_id:, department_id:, order_type:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/chart/configuration/facilities",
          method: :get,
          params: params.merge!(departmentid: department_id, ordertype: order_type)
        )

        response.map { |facility| AthenaHealth::Facility.new(facility) }
      end

      def all_medications(practice_id:, search_value:)
        response = @api.call(
          endpoint: "#{practice_id}/reference/medications",
          method: :get,
          params: { searchvalue: search_value }
        )

        response.map { |medication| AthenaHealth::Medication.new(medication) }
      end

      def all_allergies(practice_id:, search_value:)
        response = @api.call(
          endpoint: "#{practice_id}/reference/allergies",
          method: :get,
          params: { searchvalue: search_value }
        )

        response.map { |allergy| AthenaHealth::Allergy.new(allergy) }
      end

      def all_insurances(practice_id:, plan_name:, member_id:, state:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/insurancepackages",
          method: :get,
          params: params.merge!(
            insuranceplanname: plan_name,
            memberid: member_id,
            stateofcoverage: state
          )
        )

        AthenaHealth::InsuranceCollection.new(response)
      end

      def all_order_types(practice_id:, search_value:)
        response = @api.call(
          endpoint: "#{practice_id}/reference/order/lab",
          method: :get,
          params: { searchvalue: search_value }
        )

        response.map { |ordertype| AthenaHealth::OrderType.new(ordertype) }
      end

      def all_gender_identities(practice_id:, show2015edcehrtvalues: nil, limit: nil, offset: nil)
        params = {
          show2015edcehrtvalues: show2015edcehrtvalues, limit: limit, offset: offset
        }.reject { |_k, v| v.nil? }

        GenderIdentityFieldCollection.new(
          @api.call(
            endpoint: "#{practice_id}/configuration/patients/genderidentity",
            method: :get,
            params: params
          )
        )
      end

      def available_screening_questionaires(practice_id:, limit: nil, offset: nil)
        params = {
          limit: limit, offset: offset
        }.reject { |_k, v| v.nil? }

        AthenaHealth::ScreeningQuestionaire::ScreeningQuestionaireTemplateCollection.new(
          @api.call(
            endpoint: "#{practice_id}/chart/questionnairescreeners",
            method: :get,
            params: params
          )
        )
      end
    end
  end
end
