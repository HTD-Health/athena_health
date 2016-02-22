require 'spec_helper'

describe AthenaHealth::Endpoints::Appointments do
  describe '#open_appointment_slots' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 1,
        appointment_type_id: 1
      }
    end

    it 'returns instance of AppointmentCollection' do
      VCR.use_cassette('open_appointment_slots') do
        expect(client.open_appointment_slots(attributes))
          .to be_an_instance_of AthenaHealth::AppointmentCollection
      end
    end
  end
end
