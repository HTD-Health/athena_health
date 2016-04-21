require 'spec_helper'

describe AthenaHealth::PharmacyCollection do
  let(:pharmacy_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'pharmacies': [{
        'pharmacytype': 'RETAIL',
        'state': 'GA',
        'city': 'Rome',
        'receivertype': 'ERX',
        'acceptfax': 'true',
        'clinicalproviderid': '10814080',
        'zip': '30161',
        'phonenumber': '7062959239',
        'clinicalprovidername': 'CVS\/Pharmacy #5417',
        'address1': '1201 Turner McCall Blvd.',
        'address2': '1211 Turner McCall Blvd.',
        'faxnumber': '7062328863'
      }],
      'totalcount': 1
    }
  end

  subject { AthenaHealth::PharmacyCollection.new(pharmacy_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.pharmacies.map(&:class)).to eq [AthenaHealth::Pharmacy]
  end
end
