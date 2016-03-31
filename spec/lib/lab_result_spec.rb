require 'spec_helper'

describe AthenaHealth::LabResult do
  let(:lab_result_attributes) do
    {
      'labresultdate': '04\/21\/2011',
      'labresultnote': 'sample note',
      'labresultid': '3265',
      'analytes': [],
      'description': 'lab result'
    }
  end

  subject { AthenaHealth::LabResult.new(lab_result_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      labresultdate: '04\/21\/2011',
      labresultnote: 'sample note',
      labresultid: 3265,
      analytes: [],
      description: 'lab result'
    )
  end
end
