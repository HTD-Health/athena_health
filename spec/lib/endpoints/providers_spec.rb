require 'spec_helper'

describe AthenaHealth::Endpoints::Providers do
  describe '#all_providers' do
    let(:attributes) { { practice_id: 195_900 } }

    it 'returns instance of ProviderCollection' do
      VCR.use_cassette('all_providers') do
        expect(client.all_providers(attributes))
          .to be_an_instance_of AthenaHealth::ProviderCollection
      end
    end
  end
end
