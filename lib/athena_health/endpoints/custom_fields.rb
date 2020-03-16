# frozen_string_literal: true

module AthenaHealth
  module Endpoints
    module CustomFields
      def all_custom_fields(practice_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/customfields",
          method: :get,
          params: params
        )
        response.map { |field| CustomField.new(field) }
      end
    end
  end
end
