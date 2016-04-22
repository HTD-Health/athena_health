require 'spec_helper'

describe AthenaHealth::Medication do
  let(:medication_attributes) do
    {
      'medicationid': '362851',
      'medication': 'asparaginase (Erwinia chrysan)'
    }
  end

  subject { AthenaHealth::Medication.new(medication_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      medicationid: 362851,
      medication: 'asparaginase (Erwinia chrysan)'
    )
  end
end
