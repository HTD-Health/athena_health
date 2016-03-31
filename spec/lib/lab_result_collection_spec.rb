require 'spec_helper'

describe AthenaHealth::LabResultCollection do
  let(:lab_result_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'totalcount': 1,
      'results': [{
          'labresultdate': '04\/21\/2011',
          'labresultnote': 'sample note',
          'labresultid': '3265',
          'analytes': [],
          'description': 'lab result'
      }]
    }
  end

  subject { AthenaHealth::LabResultCollection.new(lab_result_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.results.map(&:class)).to eq [AthenaHealth::LabResult]
  end
end
