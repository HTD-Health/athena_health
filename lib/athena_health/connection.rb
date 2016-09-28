require 'json'

module AthenaHealth
  class Connection
    BASE_URL    = 'https://api.athenahealth.com'.freeze
    AUTH_PATH   = { 'v1' => 'oauth', 'preview1' => 'oauthpreview', 'openpreview1' => 'oauthopenpreview' }

    def initialize(version:, key:, secret:, token: nil, base_url: BASE_URL)
      @version = version
      @key = key
      @secret = secret
      @token = token
      @base_url = base_url
    end

    def authenticate
      response = Typhoeus.post(
        "#{@base_url}/#{AUTH_PATH[@version]}/token",
        userpwd: "#{@key}:#{@secret}",
        body: { grant_type: 'client_credentials' }
      ).response_body

      @token = JSON.parse(response)['access_token']
    end

    def call(endpoint:, method:, params: {}, body: {}, second_call: false)
      authenticate if @token.nil?

      response = Typhoeus::Request.new(
        "#{@base_url}/#{@version}/#{endpoint}",
        method: method,
        headers: { "Authorization" => "Bearer #{@token}"},
        params: params,
        body: body
      ).run

      if response.response_code == 401 && !second_call
        authenticate
        return call(endpoint: endpoint, method: method, second_call: true, body: body, params: params)
      end

      if response.response_code == 403 && !second_call
        return call(endpoint: endpoint, method: method, second_call: true, body: body, params: params)
      end

      body = response.response_body

      if [400, 409].include? response.response_code
        fail AthenaHealth::ValidationError.new(json_response(body))
      end

      if response.response_code != 200
        AthenaHealth::Error.new(code: response.response_code).render
      end

      json_response(body)
    end

    private

    def json_response(body)
      JSON.parse(body)
    end
  end
end
