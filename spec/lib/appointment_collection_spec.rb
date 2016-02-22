require 'spec_helper'

describe AthenaHealth::AppointmentCollection do
  let(:appointment_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'appointments': [
        {
          'date': '02\/23\/2016',
          'appointmentid': '663560',
          'departmentid': '1',
          'appointmenttype': 'Any 15',
          'providerid': '71',
          'starttime': '12:15',
          'duration': 30,
          'appointmenttypeid': '82',
          'patientappointmenttypename': 'Established Patient'
        }
      ],
      'totalcount': 1,
    }
  end

  subject { AthenaHealth::AppointmentCollection.new(appointment_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.appointments.map(&:class)).to eq [AthenaHealth::Appointment]
  end
end
