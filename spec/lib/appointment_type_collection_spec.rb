require 'spec_helper'

describe AthenaHealth::AppointmentTypeCollection do
  let(:appointment_type_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'appointmenttypes': [
        {
          'shortname': 'OV',
          'name': 'Office Visit',
          'duration': '10',
          'patientdisplayname': 'Office Visit',
          'appointmenttypeid': '2',
          'generic': 'true',
          'patient': 'true',
          'templatetypeonly': 'false'
        }
      ],
      'totalcount': 1,
    }
  end

  subject { AthenaHealth::AppointmentTypeCollection.new(appointment_type_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.appointment_types.map(&:class)).to eq [AthenaHealth::AppointmentType]
  end
end
