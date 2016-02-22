module AthenaHealth
  module Endpoints
    module Practices
      def all_practices(params: {})
        response = @api.call(
          endpoint: '1/practiceinfo',
          method: :get,
          params: params
        )

        PracticeCollection.new(response)
      end

      def find_practice(practice_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/practiceinfo",
          method: :get,
          params: params
        )

        PracticeCollection.new(response).practices.first
      end

      def all_providers(practice_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/providers",
          method: :get,
          params: params
        )

        ProviderCollection.new(response)
      end
    end
  end
end
