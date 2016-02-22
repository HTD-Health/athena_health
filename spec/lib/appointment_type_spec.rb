require 'spec_helper'

describe AthenaHealth::AppointmentType do
  let(:appointment_type_attributes) do
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
  end

  subject { AthenaHealth::AppointmentType.new(appointment_type_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      shortname: 'OV',
      name: 'Office Visit',
      duration: 10,
      patientdisplayname: 'Office Visit',
      appointmenttypeid: 2,
      generic: true,
      patient: true,
      templatetypeonly: false
    )
  end
end
