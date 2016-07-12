require 'spec_helper'

describe AthenaHealth::Analyte do
  let(:analyte_attributes) do
    {
      'value': '80',
      'analytename': 'HDL',
      'analyteid': '402',
      'loinc': 'Logical observations',
      'units': 'units',
      'analytedate': '06\/18\/2010',
      'description': 'description',
      'note': 'note',
      'valuestatus': 'Value status',
      'referencerange': 'Reference range of values'
    }
  end

  subject { AthenaHealth::Analyte.new(analyte_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      value: '80',
      analytename: 'HDL',
      analyteid: 402,
      analytedate: '06\/18\/2010',
      loinc: 'Logical observations',
      units: 'units',
      analytedate: '06\/18\/2010',
      description: 'description',
      note: 'note',
      valuestatus: 'Value status',
      referencerange: 'Reference range of values'
    )
  end
end
