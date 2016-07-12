require 'spec_helper'

describe AthenaHealth::UserMedicationEvent do
  let(:user_medication_event_attributes) do
    {
      'eventdate': '06/02/2016',
      'type': 'ENTER'
    }
  end

  subject { AthenaHealth::UserMedicationEvent.new(user_medication_event_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      eventdate: '06/02/2016',
      type: 'ENTER'
    )
  end
end
