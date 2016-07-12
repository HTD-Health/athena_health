require 'spec_helper'

describe AthenaHealth::UserMedicationSig do
  let(:user_medication_sig_attributes) do
    {
      'dosageroute': 'oral',
      'dosageaction': 'TAKE',
      'dosageadditionalinstructions': 'in the morning',
      'dosagefrequencyunit': 'per day',
      'dosagequantityunit': 'mg',
      'dosagequantityvalue': '75',
      'dosagedurationunit': 'day'
    }
  end

  subject { AthenaHealth::UserMedicationSig.new(user_medication_sig_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      dosageroute: 'oral',
      dosageaction: 'TAKE',
      dosageadditionalinstructions: 'in the morning',
      dosagefrequencyunit: 'per day',
      dosagequantityunit: 'mg',
      dosagequantityvalue: 75,
      dosagedurationunit: 'day'
    )
  end
end
