require 'spec_helper'

describe AthenaHealth::Client do
  describe '#initialize' do
    it 'creates new instance of AthenaHealth::Connection' do
      expect(AthenaHealth::Connection).to receive(:new).with(client_attributes)

      client
    end
  end
end
