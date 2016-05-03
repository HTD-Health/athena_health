require 'spec_helper'

describe AthenaHealth::Laboratory do
  let(:laboratory_attributes) do
    {
      'state': 'GA',
      'city': 'Rome',
      'acceptfax': 'true',
      'clinicalproviderid': '10814080',
      'zip': '30161',
      'phonenumber': '7062959239',
      'clinicalprovidername': 'CVS\/Laboratory #5417',
      'address1': '1201 Turner McCall Blvd.',
      'address2': '1211 Turner McCall Blvd.',
      'faxnumber': '7062328863'
    }
  end

  subject { AthenaHealth::Laboratory.new(laboratory_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      state: 'GA',
      city: 'Rome',
      acceptfax: true,
      clinicalproviderid: 10814080,
      zip: '30161',
      phonenumber: '7062959239',
      clinicalprovidername: 'CVS\/Laboratory #5417',
      address1: '1201 Turner McCall Blvd.',
      address2: '1211 Turner McCall Blvd.',
      faxnumber: '7062328863'
    )
  end
end
