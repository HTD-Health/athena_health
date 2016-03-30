require 'spec_helper'

describe AthenaHealth::EncounterCollection do
  let(:encounter_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'encounters': [{
          'encountertype': 'VISIT',
          'patientstatusid': '1',
          'stage': 'INTAKE',
          'status': 'OPEN',
          'appointmentid': '660784',
          'patientlocationid': '21',
          'encounterdate': '02\/02\/2016',
          'encountervisitname': 'Any 15',
          'patientlocation': 'Patient Rm. 1',
          'encounterid': '32705',
          'lastupdated': '02\/01\/2016',
          'patientstatus': 'Ready For Staff'
      }],
      'totalcount': 1
    }
  end

  subject { AthenaHealth::EncounterCollection.new(encounter_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.encounters.map(&:class)).to eq [AthenaHealth::Encounter]
  end
end
