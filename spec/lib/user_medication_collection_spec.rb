require 'spec_helper'

describe AthenaHealth::UserMedicationCollection do
  let(:user_medication_collection_attributes) do
    {
      'lastupdated': '06/03/2016',
      'medications':
        [{
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
                'eventdate': '06\/02\/2016',
                'type': 'ENTER'
            }],
            'medication': 'Plavix 75 mg tablet',
            'unstructuredsig': 'Take 75 mg by oral route in the morning.'
        }]
    }
  end

  subject { AthenaHealth::UserMedicationCollection.new(user_medication_collection_attributes) }

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      lastupdated: '06/03/2016',
    )

    # expect(subject.medications.map(&:class)).to eq [AthenaHealth::UserMedication]
  end
end
