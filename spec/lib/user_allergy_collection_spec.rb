require 'spec_helper'

describe AthenaHealth::UserAllergyCollection do
  let(:user_allergy_collection_attributes) do
  {
      'lastupdated': '05/26/2016',
      'nkda': 'false',
      'sectionnote': 'test',
      'allergies': [{
          'allergenname': 'asparaginase',
          'allergenid': '14041',
          'reactions': []
      }]
    }
  end

  subject { AthenaHealth::UserAllergyCollection.new(user_allergy_collection_attributes) }

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      lastupdated: '05/26/2016',
      nkda: false,
      sectionnote: 'test',
    )

    expect(subject.allergies.map(&:class)).to eq [AthenaHealth::UserAllergy]
  end
end
