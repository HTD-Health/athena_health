module AthenaHealth
  class Client
    PRODUCTION_BASE_URL = 'https://api.platform.athenahealth.com'.freeze
    PREVIEW_BASE_URL = 'https://api.preview.platform.athenahealth.com'.freeze
    API_VERSION = 'v1'.freeze

    def initialize(client_id:, secret:, production: false, auth_token_hash: nil)
      base_url = Client.base_url(production: production)
      @token = AthenaHealth::AuthToken.new(
        client_id: client_id,
        secret: secret,
        auth_token_hash: auth_token_hash,
        base_url: base_url,
        api_version: API_VERSION
      )
      @api = AthenaHealth::Connection.new(
        base_url: base_url, api_version: API_VERSION, token: @token
      )
    end

    def serialized_token
      @token.serialized_token
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

    def self.base_url(production:)
      production ? PRODUCTION_BASE_URL : PREVIEW_BASE_URL
    end
  end
end
