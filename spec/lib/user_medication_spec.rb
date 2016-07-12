require 'spec_helper'

describe AthenaHealth::UserMedication do
  let(:user_medication_attributes) do
    {
      'source': 'Kandi Haworth, MD',
      'orderingmode': 'PRESCRIBE',
      'createdby': 'API-3597',
      'isstructuredsig': 'true',
      'medicationid': '236346',
      'refillsallowed': '0',
      'route': 'FAX',
      'encounterid': '33016',
      'issafetorenew': 'true',
      'medicationentryid': 'C118016',
      'structuredsig': {
          'dosageroute': 'oral',
          'dosageaction': 'TAKE',
          'dosageadditionalinstructions': 'in the morning',
          'dosagefrequencyunit': 'per day',
          'dosagequantityunit': 'mg',
          'dosagequantityvalue': '75',
          'dosagedurationunit': 'day'
      },
      'events': [{
          'eventdate': '06/02/2016',
          'type': 'ENTER'
      }],
      'medication': 'Plavix 75 mg tablet',
      'unstructuredsig': 'Take 75 mg by oral route in the morning.'
    }
  end

  subject { AthenaHealth::UserMedication.new(user_medication_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      source: 'Kandi Haworth, MD',
      orderingmode: 'PRESCRIBE',
      createdby: 'API-3597',
      isstructuredsig: true,
      medicationid: 236346,
      refillsallowed: 0,
      route: 'FAX',
      encounterid: 33016,
      issafetorenew: 'true',
      medicationentryid: 'C118016',
      medication: 'Plavix 75 mg tablet',
      unstructuredsig: 'Take 75 mg by oral route in the morning.'
    )

    expect(subject.events.map(&:class)).to eq [AthenaHealth::UserMedicationEvent]
    expect(subject.structuredsig.class).to eq AthenaHealth::UserMedicationSig
  end
end
