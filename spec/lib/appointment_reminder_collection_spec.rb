require 'spec_helper'

describe AthenaHealth::AppointmentReminderCollection do
  let(:appointment_reminder_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'reminders': [
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
      ],
      'totalcount': 1,
    }
  end

  subject { AthenaHealth::AppointmentReminderCollection.new(appointment_reminder_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.reminders.map(&:class)).to eq [AthenaHealth::AppointmentReminder]
  end
end
