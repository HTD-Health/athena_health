require 'spec_helper'

describe AthenaHealth::AnalyteCollection do
  let(:analyte_collection_attributes) do
  {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'analytes': [{
          'value': '80',
          'analytename': 'HDL',
          'analyteid': '402',
          'analytedate': '06\/18\/2010'
      }],
      'totalcount': 1
    }
  end

  subject { AthenaHealth::AnalyteCollection.new(analyte_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.analytes.map(&:class)).to eq [AthenaHealth::Analyte]
  end
end
