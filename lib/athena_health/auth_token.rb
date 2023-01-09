require 'json'

module AthenaHealth
  class AuthToken
    def initialize(client_id:, secret:, base_url:, api_version:, auth_token_hash: nil)
      @base_url = base_url
      @api_version = api_version
      @client_id = client_id
      @secret = secret
      reset!
      parse_auth_token_hash!(auth_token_hash) unless auth_token_hash.nil?
    end

    def auth_header
      { 'Authorization' => "Bearer #{token}" }
    end

    def reset!
      @access_token = nil
      @expires_at = nil
    end

    def serialized_token
      {
        'access_token' => token,
        'expires_at' => @expires_at.to_i
      }
    end

    private

    def token
      fetch_token! unless valid?
      @access_token
    end

    def valid?
      !@access_token.nil? &&
        !@expires_at.nil? &&
        @expires_at > Time.now
    end

    def parse_auth_token_hash!(auth_token_hash)
      # make sure it has the right parts
      return unless auth_token_hash['access_token'].instance_of? String
      return unless auth_token_hash['expires_at'].instance_of? Integer

      @access_token = auth_token_hash['access_token']
      @expires_at = Time.at(auth_token_hash['expires_at'])
    end

    def fetch_token!
      reset!
      initiated_at = Time.now
      response = Typhoeus.post(
        "#{@base_url}/oauth2/#{@api_version}/token",
        userpwd: "#{@client_id}:#{@secret}",
        body: {
          grant_type: 'client_credentials',
          scope: 'athena/service/Athenanet.MDP.*'
        }
      )
      token_hash = JSON.parse(response.response_body)
      expires_in = token_hash['expires_in'].to_i
      @access_token = token_hash['access_token']
      @expires_at = initiated_at + expires_in
    end
  end
end
