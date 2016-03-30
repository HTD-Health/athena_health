require 'spec_helper'

describe AthenaHealth::Endpoints::Encounters do
  describe '#find_encounter' do
    let(:attributes) do
      {
        practice_id: 195_900,
        encounter_id: 28302
      }
    end

    it 'returns instance of Encounter' do
      VCR.use_cassette('find_encounter') do
        expect(client.find_encounter(attributes))
          .to be_an_instance_of AthenaHealth::Encounter
      end
    end
  end
end
