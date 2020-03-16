# frozen_string_literal: true

require 'spec_helper'

describe AthenaHealth::Endpoints::Claims do
  describe '#find_department' do
    let(:practice_id) { 195_900 }

    it 'returns instance of a Claim' do
      VCR.use_cassette('claims') do
        expect(client.find_claim(practice_id: practice_id, claim_id: '301'))
          .to be_an_instance_of AthenaHealth::Claim::Claim
      end
    end
  end
end
