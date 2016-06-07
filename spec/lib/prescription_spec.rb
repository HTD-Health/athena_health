require 'spec_helper'

describe AthenaHealth::Prescription do
  let(:prescription_attributes) do
    {
      'prescriptionid': '107266',
      'priority': '2',
      'assignedto': 'wcenteno0',
      'documentclass': 'PRESCRIPTION',
      'createddatetime': '2015-05-20T13:39:21-04:00',
      'documentroute': 'FAX',
      'documentsource': 'UPLOAD',
      'createddate': '05\/20\/2015',
      'status': 'DATAENTRY',
      'documentdescription': 'prescription - renewal',
      'encounterdate': '05\/20\/2015',
      'lastmodifieddatetime': '2015-05-20T13:39:21-04:00',
      'documentsubclass': 'PRESCRIPTION_RENEWAL',
      'encounterid': '1',
      'providerid': '1'
    }
  end

  subject { AthenaHealth::Prescription.new(prescription_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      prescriptionid: 107266,
      priority: 2,
      assignedto: 'wcenteno0',
      documentclass: 'PRESCRIPTION',
      createddatetime: '2015-05-20T13:39:21-04:00',
      documentroute: 'FAX',
      documentsource: 'UPLOAD',
      createddate: '05\/20\/2015',
      status: 'DATAENTRY',
      documentdescription: 'prescription - renewal',
      encounterdate: '05\/20\/2015',
      lastmodifieddatetime: '2015-05-20T13:39:21-04:00',
      documentsubclass: 'PRESCRIPTION_RENEWAL',
      encounterid: 1,
      providerid: 1
    )
  end
end
