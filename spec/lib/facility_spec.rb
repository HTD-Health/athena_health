require 'spec_helper'

describe AthenaHealth::Facility do
  let(:facility_attributes) do
    {
      'distance': '185.3',
      'state': 'GA',
      'address': '775 POPLAR ROAD, SUITE 100',
      'name': 'NEWNAN PLAZA PHARMACY- NEWNAN, GA',
      'facilityid': '2254664',
      'faxnumber': '(770) 683-4101',
      'pharmacytype': 'RETAIL',
      'city': 'NEWNAN',
      'zipcode': '30265',
      'phonenumber': '(770) 683-3784'
    }
  end

  subject { AthenaHealth::Facility.new(facility_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      distance: '185.3',
      state: 'GA',
      address: '775 POPLAR ROAD, SUITE 100',
      name: 'NEWNAN PLAZA PHARMACY- NEWNAN, GA',
      facilityid: 2254664,
      faxnumber: '(770) 683-4101',
      pharmacytype: 'RETAIL',
      city: 'NEWNAN',
      zipcode: '30265',
      phonenumber: '(770) 683-3784'
    )
  end
end
