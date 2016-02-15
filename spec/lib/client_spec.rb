require 'spec_helper'

describe AthenaHealth::Client do
  describe '#initialize' do
    it 'creates new instance of AthenaHealth::Connection' do
      expect(AthenaHealth::Connection).to receive(:new).with(version: 'preview1', key: 'test_key', secret: 'test_secret')

      AthenaHealth::Client.new(version: 'preview1', key: 'test_key', secret: 'test_secret')
    end
  end
end
