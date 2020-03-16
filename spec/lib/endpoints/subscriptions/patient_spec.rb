# frozen_string_literal: true

require 'spec_helper'

describe AthenaHealth::Endpoints::Subscriptions do
  let(:attributes) do
    {
      practice_id: 195_900,
      department_id: 1
    }
  end

  describe 'patient subscriptions' do
    describe '#create_patient_subscription' do
      it 'returns success => true' do
        VCR.use_cassette('patient_subscription') do
          expect(client.create_patient_subscription(
                   practice_id: 195_900
                 )).to eq 'success' => true
        end
      end
    end

    describe '#changed_patients' do
      it 'returns instance of PatientCollection' do
        VCR.use_cassette('patient_subscription') do
          expect(client.changed_patients(
                   practice_id: 195_900,
                   department_id: 1
                 )).to be_an_instance_of AthenaHealth::PatientCollection
        end
      end
    end

    describe '#patient_subscription' do
      it 'returns instance of an active Subscription' do
        VCR.use_cassette('patient_subscription') do
          subscription = client.patient_subscription(
            practice_id: 195_900
          )
          expect(subscription).to be_an_instance_of AthenaHealth::Subscription
          expect(subscription.events).to match_array(%w[AddPatient DeletePatient MergePatient UpdatePatient UpdatePatientCustomField])
          expect(subscription.active?).to equal(true)
        end
      end

      it 'returns instance of an inactive Subscription' do
        VCR.use_cassette('patient_subscription') do
          subscription = client.patient_subscription(
            practice_id: 123
          )
          expect(subscription).to be_an_instance_of AthenaHealth::Subscription
          expect(subscription.events).to match_array([])
          expect(subscription.active?).to equal(false)
        end
      end
    end
  end
end
