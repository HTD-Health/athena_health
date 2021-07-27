require 'json'

module AthenaHealth
  class Connection
    PRODUCTION_BASE_URL    = 'https://api.platform.athenahealth.com'.freeze
    PREVIEW_BASE_URL = 'https://api.preview.platform.athenahealth.com'.freeze
    API_VERSION = 'v1'.freeze

    def initialize(client_id:, secret:, token: nil, production: )
      @client_id = client_id
      @secret = secret
      @token = token
      @production = production
    end

    def authenticate
      response = Typhoeus.post(
        "#{base_url}/oauth2/#{API_VERSION}/token",
        userpwd: "#{@client_id}:#{@secret}",
        body: { 
          grant_type: 'client_credentials', 
          scope: 'athena/service/Athenanet.MDP.*' 
        }
      ).response_body

      @token = JSON.parse(response)['access_token']
    end

    def call(endpoint:, method:, params: {}, body: {}, second_call: false)
      authenticate if @token.nil?

      response = Typhoeus::Request.new(
        "#{base_url}/#{API_VERSION}/#{endpoint}",
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

    def base_url
      @base_url ||= @production ? PRODUCTION_BASE_URL : PREVIEW_BASE_URL
    end
  end
end
