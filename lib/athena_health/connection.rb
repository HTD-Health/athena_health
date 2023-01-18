require 'json'

module AthenaHealth
  class Connection
    def initialize(base_url:, api_version:, token:)
      @token = token
      @api_version = api_version
      @base_url = base_url
    end

    def call(endpoint:, method:, params: {}, body: {}, second_call: false)
      response = Typhoeus::Request.new(
        "#{@base_url}/#{@api_version}/#{endpoint}",
        method: method,
        headers: @token.auth_header,
        params: params,
        body: body
      ).run

      if response.response_code == 401 && !second_call
        @token.reset!
        return call(endpoint: endpoint, method: method, second_call: true, body: body, params: params)
      end

      if response.response_code == 403 && !second_call
        return call(endpoint: endpoint, method: method, second_call: true, body: body, params: params)
      end

      body = response.response_body

      raise AthenaHealth::ValidationError, json_response(body) if [400, 409].include? response.response_code

      AthenaHealth::Error.new(code: response.response_code).render if response.response_code != 200

      json_response(body)
    end

    private

    def json_response(body)
      JSON.parse(body)
    end
  end
end
