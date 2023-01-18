require 'spec_helper'
require 'timecop'

describe AthenaHealth::AuthToken do
  let(:token_attributes) do
    {
      client_id: 'test_key',
      secret: 'test_secret',
      auth_token_hash: auth_token_hash,
      base_url: AthenaHealth::Client.base_url(production: production),
      api_version: AthenaHealth::Client::API_VERSION
    }
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

  let(:auth_token) { AthenaHealth::AuthToken.new(**token_attributes) }

  describe 'pase and serialize' do
    it 'serialzes to the same as the parse' do
      key_result = auth_token.serialized_token
      expect(key_result).to eq auth_token_hash
    end
  end

  describe '#authenticate' do
    context 'when production is true' do
      let(:production) { true }
      let(:key_result) { 'prod_test_access_token' }
      let(:auth_token_hash) { nil }
      it 'returns token' do
        Timecop.freeze(freeze_time) do
          VCR.use_cassette('production_authentication', match_requests_on: %i[uri body headers]) do
            key_result = auth_token.serialized_token
            expect(key_result['access_token']).to eq 'prod_test_access_token'
            expect(key_result['expires_at']).to eq(freeze_time.to_i + 3600)
          end
        end
      end
    end

    context 'when production is false' do
      let(:production) { false }
      let(:key_result) { 'test_access_token' }
      let(:auth_token_hash) { nil }
      it 'returns token' do
        Timecop.freeze(freeze_time) do
          VCR.use_cassette('preview_authentication', match_requests_on: %i[uri body headers]) do
            key_result = auth_token.serialized_token
            expect(key_result['access_token']).to eq 'test_access_token'
            expect(key_result['expires_at']).to eq(freeze_time.to_i + 3600)
          end
        end
      end
    end
  end
end
