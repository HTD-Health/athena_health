# frozen_string_literal: true

require 'spec_helper'

describe AthenaHealth::Endpoints::Subscriptions do
  let(:attributes) do
    {
      practice_id: 195_900,
      department_id: 1
    }
  end

  describe 'provider subscriptions' do
    describe '#create_provider_subscription' do
      it 'returns success => true' do
        VCR.use_cassette('provider_subscription') do
          expect(client.create_provider_subscription(
                   practice_id: 195_900
                 )).to eq 'success' => true
        end
      end
    end

    describe '#changed_providers' do
      it 'returns instance of ProviderCollection' do
        VCR.use_cassette('provider_subscription') do
          expect(client.changed_providers(
                   practice_id: 195_900,
                   department_id: 1
                 )).to be_an_instance_of AthenaHealth::ProviderCollection
        end
      end
    end

    describe '#provider_subscription' do
      it 'returns instance of an active Subscription' do
        VCR.use_cassette('provider_subscription') do
          subscription = client.provider_subscription(
            practice_id: 195_900
          )
          expect(subscription).to be_an_instance_of AthenaHealth::Subscription
          expect(subscription.events).to match_array(%w[ProviderAdd ProviderDelete ProviderUndelete ProviderUpdate])
          expect(subscription.active?).to equal(true)
        end
      end

      it 'returns instance of an inactive Subscription' do
        VCR.use_cassette('provider_subscription') do
          subscription = client.provider_subscription(
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
