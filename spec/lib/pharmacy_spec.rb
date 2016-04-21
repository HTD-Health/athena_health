require 'spec_helper'

describe AthenaHealth::Pharmacy do
  let(:pharmacy_attributes) do
    {
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
    }
  end

  subject { AthenaHealth::Pharmacy.new(pharmacy_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      pharmacytype: 'RETAIL',
      state: 'GA',
      city: 'Rome',
      receivertype: 'ERX',
      acceptfax: true,
      clinicalproviderid: 10814080,
      zip: '30161',
      phonenumber: '7062959239',
      clinicalprovidername: 'CVS\/Pharmacy #5417',
      address1: '1201 Turner McCall Blvd.',
      address2: '1211 Turner McCall Blvd.',
      faxnumber: '7062328863'
    )
  end
end
