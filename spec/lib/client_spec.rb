require 'spec_helper'

describe AthenaHealth::Client do
  describe '#initialize' do
    it 'creates new instance of AthenaHealth::AuthToken' do
      expect(AthenaHealth::AuthToken).to receive(:new).with(
        client_attributes.slice(:client_id, :secret, :auth_token_hash)
        .merge(
          { api_version: 'v1', base_url: 'https://api.preview.platform.athenahealth.com' }
        )
      )
      client
    end

    it 'generates the auth hash' do
      expect(client.serialized_token).to eq(client_attributes[:auth_token_hash])
    end
  end
end
