require 'spec_helper'

describe AthenaHealth::AppointmentWaitlist do
  let(:appointment_waitlist_attributes) do
    {
      'allowanydepartment': true,
      'appointmentid': '663560',
      'appointmenttypeid': '65366',
      'dayofweekids': [1, 4, 5],
      'departmentid': '1',
      'hourfrom': '7',
      'hourto': '12',
      'note': 'I am asking for several calls, I have a hearing problem.',
      'patientid': '1',
      'priority': 'NORMAL',
      'providerid': '71',
    }
  end

  subject { AthenaHealth::AppointmentWaitlist.new(appointment_waitlist_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    p subject
    expect(subject).to have_attributes(
                          allowanydepartment: true,
                          appointmentid: 663560,
                          appointmenttypeid: 65366,
                          dayofweekids: [1,4,5],
                          departmentid: 1,
                          hourfrom: 7,
                          hourto: 12,
                          note: 'I am asking for several calls, I have a hearing problem.',
                          patientid: 1,
                          priority: 'NORMAL',
                          providerid: 71,
                         )
  end
end
