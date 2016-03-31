require 'spec_helper'

describe AthenaHealth::PrescriptionCollection do
  let(:prescription_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
       'prescriptions': [{
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
          'documentsubclass': 'PRESCRIPTION_RENEWAL'
      }],
      'totalcount': 1
    }
  end

  subject { AthenaHealth::PrescriptionCollection.new(prescription_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.prescriptions.map(&:class)).to eq [AthenaHealth::Prescription]
  end
end
