# frozen_string_literal: true

require 'spec_helper'

describe AthenaHealth::Endpoints::Subscriptions do
  let(:attributes) do
    {
      practice_id: 195_900,
      department_id: 1
    }
  end

  describe 'appointment subscriptions' do
    describe '#create_appointment_subscription' do
      it 'returns success => true' do
        VCR.use_cassette('appointment_subscription') do
          expect(client.create_appointment_subscription(
                   practice_id: 195_900
                 )).to eq 'success' => 'true'
        end
      end
    end

    describe '#changed_appointments' do
      it 'returns instance of AppointmentCollection' do
        VCR.use_cassette('appointments_changed') do
          expect(client.changed_appointments(
                   practice_id: 195_900,
                   department_id: 1
                 )).to be_an_instance_of AthenaHealth::AppointmentCollection
        end
      end
    end

    describe '#appointment_subscription' do
      it 'returns instance of an active Subscription' do
        VCR.use_cassette('appointment_subscription') do
          subscription = client.appointment_subscription(
            practice_id: 195_900
          )
          expect(subscription).to be_an_instance_of AthenaHealth::Subscription
          expect(subscription.events).to match_array(%w[AddAppointmentSlot CancelAppointment CheckIn CheckOut DeleteAppointment FreezeAppointment ScheduleAppointment UnfreezeAppointment UpdateAppointment])
          expect(subscription.active?).to equal(true)
        end
      end

      it 'returns instance of an inactive Subscription' do
        VCR.use_cassette('appointment_subscription') do
          subscription = client.appointment_subscription(
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
