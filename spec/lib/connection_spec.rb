require 'spec_helper'

describe AthenaHealth::Connection do
  let(:connection) { AthenaHealth::Connection.new(version: version, key: 'test_key', secret: 'test_secret') }

  it 'has defined BASE_URL constant' do
    expect(AthenaHealth::Connection::BASE_URL).to eq 'https://api.athenahealth.com'
  end

  it 'has defined AUTH_PATH constant' do
    expect(AthenaHealth::Connection::AUTH_PATH).to eq 'v1' => 'oauth', 'preview1' => 'oauthpreview', 'openpreview1' => 'oauthopenpreview'
  end

  describe '#authenticate' do
    context 'when version is preview1' do
      let(:version) { 'v1' }

      it 'returns token' do
        VCR.use_cassette('v1_authentication') do
          expect(connection.authenticate).to eq 'test_access_token'
        end
      end
    end

    context 'when version is preview1' do
      let(:version) { 'preview1' }

      it 'returns token' do
        VCR.use_cassette('preview1_authentication') do
          expect(connection.authenticate).to eq 'test_access_token'
        end
      end
    end

    context 'when version is openpreview1' do
      let(:version) { 'openpreview1' }

      it 'returns token' do
        VCR.use_cassette('openpreview1_authentication') do
          expect(connection.authenticate).to eq 'test_access_token'
        end
      end
    end
  end

  describe '#call' do
    let(:version)       { 'preview1' }
    let(:response_body) { '{"body":"value"}' }
    let(:request)       { instance_double('request', response_code: response_code, response_body: response_body) }

    before do
      allow(connection).to receive(:authenticate) { connection.instance_variable_set(:@token, 'test_access_token') }
      expect(Typhoeus::Request).to receive(:new).with('https://api.athenahealth.com/preview1/test_endpoint', method: :get, headers: { Authorization: 'Bearer test_access_token' }) { request }
      expect(request).to receive(:run) { request }
    end

    context 'when response_code is 200' do
      let(:response_code) { 200 }

      it 'returns parsed response_body' do
        expect(connection.call(endpoint: 'test_endpoint', method: :get)).to eq JSON.parse(response_body)
      end
    end

    context 'when response_code is not 200' do
      let(:response_code) { 404 }

      it 'returns error' do
        expect { connection.call(endpoint: 'test_endpoint', method: :get) }.to raise_error(
          AthenaHealth::NotFoundError
        )
      end
    end
  end
end
