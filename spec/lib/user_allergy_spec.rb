require 'spec_helper'

describe AthenaHealth::UserAllergy do
  let(:user_allergy_attributes) do
    {
      'allergenname': 'weed pollen',
      'onsetdate': '01/01/2010',
      'allergenid': '92193',
      'reactions': [{
          'reactionname': 'chest pain',
          'snomedcode': '29857009'
      }],
      'note': 'about this allergy'
    }
  end

  subject { AthenaHealth::UserAllergy.new(user_allergy_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      allergenname: 'weed pollen',
      onsetdate: '01/01/2010',
      allergenid: 92193,
      note: 'about this allergy'
    )

    expect(subject.reactions.map(&:class)).to eq [AthenaHealth::Reaction]
  end
end
