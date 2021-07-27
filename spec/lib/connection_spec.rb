require 'spec_helper'

describe AthenaHealth::Connection do
  let(:connection_attributes) do
    {
      production: production,
      client_id: 'test_key',
      secret: 'test_secret'
    }
  end

  let(:connection) { AthenaHealth::Connection.new(**connection_attributes) }

  describe '#authenticate' do
    context 'when production is true' do
      let(:production) { true }

      it 'returns token' do
        VCR.use_cassette('production_authentication') do
          expect(connection.authenticate).to eq 'prod_test_access_token'
        end
      end
    end

    context 'when production is false' do
      let(:production) { false }

      it 'returns token' do
        VCR.use_cassette('preview_authentication') do
          expect(connection.authenticate).to eq 'test_access_token'
        end
      end
    end

    
  end

  describe '#call' do
    let(:production)       { false}
    let(:response_body) { '{"body":"value"}' }
    let(:request)       { instance_double(Typhoeus::Request) }

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
