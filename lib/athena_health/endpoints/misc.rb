module AthenaHealth
  module Endpoints
    module Misc
      def patient_locations(practice_id:, params: {})
        @api.call(
          endpoint: "#{practice_id}/misc/patientlocations",
          method: :get,
          params: params
        )
      end
    end
  end
end
