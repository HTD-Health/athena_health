module AthenaHealth
  class Client
    def initialize(version:, key:, secret:, token: nil)
      @api = AthenaHealth::Connection.new(
        version: version,
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
  end
end
