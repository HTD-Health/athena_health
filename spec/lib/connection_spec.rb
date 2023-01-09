require 'spec_helper'
require 'timecop'

describe AthenaHealth::Connection do
  let(:connection_attributes) do
    {
      token: token,
      base_url: AthenaHealth::Client.base_url(production: production),
      api_version: AthenaHealth::Client::API_VERSION
    }
  end

  let(:token) do
    AthenaHealth::AuthToken.new(
      client_id: 'test_key',
      secret: 'test_secret',
      auth_token_hash: auth_token_hash,
      base_url: AthenaHealth::Client.base_url(production: production),
      api_version: AthenaHealth::Client::API_VERSION
    )
  end

  let(:production) { true }
  let(:key_result) { 'unset key_result' }
  let(:auth_token_hash) do
    {
      'access_token' => key_result,
      'expires_at' => Time.now.to_i + 3600
    }
  end
  let(:freeze_time) { Time.at(1_673_280_861) }

  let(:connection) { AthenaHealth::Connection.new(**connection_attributes) }

  describe '#call' do
    let(:production)       { false }
    let(:response_body) { '{"body":"value"}' }
    let(:request)       { instance_double(Typhoeus::Request) }
    let(:key_result) { 'test_access_token' }
    let(:response) do
      instance_double(
        Typhoeus::Response,
        response_code: response_code,
        response_body: response_body
      )
    end

    before do
      allow(connection).to receive(:authenticate) do
        connection.instance_variable_set(:@token, 'test_access_token')
      end

      expect(Typhoeus::Request).to receive(:new).with(
        'https://api.preview.platform.athenahealth.com/v1/test_endpoint',
        method: :get,
        headers: { 'Authorization' => 'Bearer test_access_token' },
        params: {},
        body: {}
      ) { request }

      expect(request).to receive(:run) { response }
    end

    context 'when response_code is 200' do
      let(:response_code) { 200 }

      it 'returns parsed response_body' do
        expect(connection.call(endpoint: 'test_endpoint', method: :get))
          .to eq JSON.parse(response_body)
      end
    end

    context 'when response_code is not 200' do
      let(:response_code) { 404 }

      it 'returns error' do
        expect { connection.call(endpoint: 'test_endpoint', method: :get) }
          .to raise_error(AthenaHealth::NotFoundError)
      end
    end
  end
end
