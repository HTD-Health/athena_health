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
end
