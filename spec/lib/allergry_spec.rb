require 'spec_helper'

describe AthenaHealth::Allergy do
  let(:allergy_attributes) do
    {
      'allergy': 'Asacol',
      'allergyid': '18628'
    }
  end

  subject { AthenaHealth::Allergy.new(allergy_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      allergy: 'Asacol',
      allergyid: 18628
    )
  end
end
