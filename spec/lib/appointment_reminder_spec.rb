require 'spec_helper'

describe AthenaHealth::AppointmentReminder do
  let(:appointment_reminder_attributes) do
    {
      'departmentid': '1',
      'approximatedate': '06\/02\/2016',
      'patientid': '3282',
      'appointmentreminderid': '13492',
      'status': 'Scheduled',
      'appointmenttypeid': '4',
      'providerid': '71',
      'note': 'Reminder note',
      'deleted': '06\/02\/2016',
      'patientinstructions': 'Sample instruction'
    }
  end

  subject { AthenaHealth::AppointmentReminder.new(appointment_reminder_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      departmentid: 1,
      approximatedate: '06\/02\/2016',
      patientid: 3282,
      appointmentreminderid: 13492,
      status: 'Scheduled',
      appointmenttypeid: 4,
      providerid: 71,
      note: 'Reminder note',
      deleted: '06\/02\/2016',
      patientinstructions: 'Sample instruction'
    )
  end
end
