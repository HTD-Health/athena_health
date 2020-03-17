# frozen_string_literal: true

require 'spec_helper'

describe AthenaHealth::Endpoints::Subscriptions do
  let(:attributes) do
    {
      practice_id: 195_900,
      department_id: 1
    }
  end

  describe 'claim subscriptions' do
    describe '#create_claim_subscription' do
      it 'returns success => true' do
        VCR.use_cassette('claim_subscription') do
          expect(client.create_claim_subscription(
                   practice_id: 195_900
                 )).to eq 'success' => true
        end
      end
    end

    describe '#changed_claims' do
      it 'returns instance of ClaimCollection' do
        VCR.use_cassette('claim_subscription') do
          expect(client.changed_claims(
                   practice_id: 195_900,
                   department_id: 1
                 )).to be_an_instance_of AthenaHealth::Claim::ClaimCollection
        end
      end
    end

    describe '#claim_subscription' do
      it 'returns instance of an active Subscription' do
        VCR.use_cassette('claim_subscription') do
          subscription = client.claim_subscription(
            practice_id: 195_900
          )
          expect(subscription).to be_an_instance_of AthenaHealth::Subscription
          expect(subscription.events).to match_array(%w[UpdateClaim])
          expect(subscription.active?).to equal(true)
        end
      end

      it 'returns instance of an inactive Subscription' do
        VCR.use_cassette('claim_subscription') do
          subscription = client.claim_subscription(
            practice_id: 123_456
          )
          expect(subscription).to be_an_instance_of AthenaHealth::Subscription
          expect(subscription.events).to match_array([])
          expect(subscription.active?).to equal(false)
        end
      end
    end
  end
end
