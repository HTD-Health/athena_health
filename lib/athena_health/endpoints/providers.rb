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
    end
  end
end
