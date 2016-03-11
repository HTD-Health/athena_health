require 'spec_helper'

describe AthenaHealth::PatientAppointmentReason do
  let(:patient_appointment_reason_attributes) do
    {
      'schedulingminhours': '48',
      'reasontype': 'existing',
      'reason': 'Sick Visit',
      'description': 'I am sick and I would like to get treatment.',
      'reasonid': '841',
      'schedulingmaxdays': '90'
    }
  end

  subject { AthenaHealth::PatientAppointmentReason.new(patient_appointment_reason_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      schedulingminhours: 48,
      reasontype: 'existing',
      reason: 'Sick Visit',
      description: 'I am sick and I would like to get treatment.',
      reasonid: 841,
      schedulingmaxdays: 90
    )
  end
end
