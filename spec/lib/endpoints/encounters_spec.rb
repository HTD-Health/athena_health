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

  describe '#encounter_orders' do
    let(:attributes) do
      {
        practice_id: 195_900,
        encounter_id: 28302
      }
    end

    it 'returns instance of Encounter' do
      VCR.use_cassette('encounter_orders') do
        expect(client.encounter_orders(attributes))
          .to be_an_instance_of AthenaHealth::OrderCollection
      end
    end
  end

  describe '#encounter_order' do
    let(:attributes) do
      {
        practice_id: 195_900,
        encounter_id: 28302,
        order_id: 116881
      }
    end

    it 'returns instance of Encounter' do
      VCR.use_cassette('encounter_order') do
        expect(client.encounter_order(attributes))
          .to be_an_instance_of AthenaHealth::Order
      end
    end
  end
end
