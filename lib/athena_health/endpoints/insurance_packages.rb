module AthenaHealth
  module Endpoints
    module InsurancePackages
      def top_insurance_packages(practice_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/misc/topinsurancepackages",
          method: :get,
          params: params
        )

        InsurancePackageCollection.new(response)
      end
    end
  end
end
