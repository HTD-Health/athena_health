require 'spec_helper'

describe AthenaHealth::Client do
  let(:client) { AthenaHealth::Client.new(version: 'preview1', key: 'test_key', secret: 'test_secret') }

  describe '#initialize' do
    it 'creates new instance of AthenaHealth::Connection' do
      expect(AthenaHealth::Connection).to receive(:new).with(version: 'preview1', key: 'test_key', secret: 'test_secret')

      client
    end
  end

  describe '#all_practices' do
    it 'returns PracticeCollection' do
      VCR.use_cassette('all_practices') do
        expect(client.all_practices).to be_an_instance_of AthenaHealth::PracticeCollection
      end
    end
  end

  describe '#find_practice' do
    it 'returns PracticeCollection' do
      VCR.use_cassette('find_practice') do
        expect(client.find_practice(practice_id: 195900)).to be_an_instance_of AthenaHealth::Practice
      end
    end
  end
end
