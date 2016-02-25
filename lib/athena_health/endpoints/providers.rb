module AthenaHealth
  module Endpoints
    module Providers
      def all_providers(practice_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/providers",
          method: :get,
          params: params
        )

        ProviderCollection.new(response)
      end

      def find_provider(practice_id:, provider_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/providers/#{provider_id}",
          method: :get,
          params: params
        )

        Provider.new(response.first)
      end
    end
  end
end
