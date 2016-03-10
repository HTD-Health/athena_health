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

  describe '#book_appointment' do
    context 'with missing appointment type' do
      let(:attributes) do
        {
          practice_id: 195_900,
          appointment_id: 665839,
          patient_id: 1
        }
      end

      it 'raise AthenaHealth::ValidationError error' do
        VCR.use_cassette('book_appointment_with_missing_appointment_type') do
          expect { client.book_appointment(attributes) }.to raise_error { |error|
            expect(error).to be_a(AthenaHealth::ValidationError)
            expect(error.details).to eq(
              {
                'detailedmessage' => 'An appointment type or reason must be provided:  1, 71, ',
                'error' => 'Additional fields are required.'
              }
            )
          }
        end
      end
    end
  end
end
