require 'spec_helper'

describe AthenaHealth::Encounter do
  let(:encounter_attributes) do
    {
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
    }
  end

  subject { AthenaHealth::Encounter.new(encounter_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      encountertype: 'VISIT',
      patientstatusid: 1,
      stage: 'INTAKE',
      status: 'OPEN',
      appointmentid: 660784,
      patientlocationid: 21,
      encounterdate: '02\/02\/2016',
      encountervisitname: 'Any 15',
      patientlocation: 'Patient Rm. 1',
      encounterid: 32705,
      lastupdated: '02\/01\/2016',
      patientstatus: 'Ready For Staff'
    )
  end
end
