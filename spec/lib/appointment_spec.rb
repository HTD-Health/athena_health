require 'spec_helper'

describe AthenaHealth::Appointment do
  let(:appointment_attributes) do
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
  end

  subject { AthenaHealth::Appointment.new(appointment_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      date: '02\/23\/2016',
      appointmentid: 663560,
      departmentid: 1,
      appointmenttype: 'Any 15',
      providerid: 71,
      starttime: '12:15',
      duration: 30,
      appointmenttypeid: 82,
      patientappointmenttypename: 'Established Patient'
    )
  end
end
