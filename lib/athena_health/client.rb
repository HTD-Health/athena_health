module AthenaHealth
  class Client
    def initialize(production: false, key:, secret:, token: nil)
      @api = AthenaHealth::Connection.new(
        production: production,
        key: key,
        secret: secret,
        token: token,
      )
    end

    include Endpoints::Practices
    include Endpoints::Departments
    include Endpoints::Patients
    include Endpoints::Appointments
    include Endpoints::Providers
    include Endpoints::InsurancePackages
    include Endpoints::Encounters
    include Endpoints::Configurations
    include Endpoints::Subscriptions
    include Endpoints::Claims
    include Endpoints::CustomFields
  end
end
