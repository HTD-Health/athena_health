require 'spec_helper'

describe AthenaHealth::PatientAppointmentReasonCollection do
  let(:patient_appointment_reason_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'patientappointmentreasons': [
        {
          'schedulingminhours': '48',
          'reasontype': 'existing',
          'reason': 'Sick Visit',
          'description': 'I am sick and I would like to get treatment.',
          'reasonid': '841',
          'schedulingmaxdays': '90'
        }
      ],
      'totalcount': 1,
    }
  end

  subject { AthenaHealth::PatientAppointmentReasonCollection.new(patient_appointment_reason_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.patient_appointment_reasons.map(&:class)).to eq [AthenaHealth::PatientAppointmentReason]
  end
end
