require 'spec_helper'

describe AthenaHealth::Endpoints::Practices do
  describe '#all_practices' do
    it 'returns instance of  PracticeCollection' do
      VCR.use_cassette('all_practices') do
        expect(client.all_practices)
          .to be_an_instance_of AthenaHealth::PracticeCollection
      end
    end
  end

  describe '#find_practice' do
    let(:attributes) { { practice_id: 195_900 } }

    it 'returns instance of Practice' do
      VCR.use_cassette('find_practice') do
        expect(client.find_practice(**attributes))
          .to be_an_instance_of AthenaHealth::Practice
      end
    end
  end
end
