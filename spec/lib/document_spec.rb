require 'spec_helper'

describe AthenaHealth::Document do
  let(:document_attributes) do
    {
      'prescriptionid': '107266',
      'priority': '2',
      'assignedto': 'wcenteno0',
      'documentclass': 'PRESCRIPTION',
      'createddatetime': '2015-05-20T13:39:21-04:00',
      'documentroute': 'FAX',
      'documentsource': 'UPLOAD',
      'createddate': '05\/20\/2015',
      'providerid': '1',
      'status': 'DATAENTRY',
      'documentdescription': 'prescription - renewal',
      'encounterdate': '05\/20\/2015',
      'encounterid': '1',
      'lastmodifieddatetime': '2015-05-20T13:39:21-04:00',
      'documentsubclass': 'PRESCRIPTION_RENEWAL',
      'orderid': '120',
      'observations': [{'analyteid': 1}]
    }
  end

  subject { AthenaHealth::Document.new(document_attributes) }

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
      providerid: 1,
      encounterid: 1,
      orderid: 120
    )

    expect(subject.observations.map(&:class)).to eq [AthenaHealth::Analyte]
  end
end
