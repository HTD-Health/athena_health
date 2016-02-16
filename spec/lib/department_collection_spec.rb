require 'spec_helper'

describe AthenaHealth::DepartmentCollection do
  let(:department_collection_attributes) do
    {
      'totalcount': 1,
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'departments': [
        {
          'creditcardtypes': ['AX', 'DS', 'MC', 'VI'],
          'medicationhistoryconsent': 'false',
          'timezoneoffset': -5,
          'providergroupid': '1',
          'singleappointmentcontractmax': '3000',
          'state': 'NY',
          'portalurl': '1959-1-practice-home-url',
          'city': 'BALLSTON SPA',
          'placeofservicefacility': 'false',
          'oneyearcontractmax': '1500',
          'providergroupname': 'Downtown Health Group',
          'doesnotobservedst': 'false',
          'departmentid': '162',
          'address': '8762 STONERIDGE CT',
          'placeofservicetypeid': '11',
          'clinicals': 'OFF',
          'timezone': -5,
          'patientdepartmentname': 'Main Office',
          'name': 'MERCY HOSPITAL',
          'placeofservicetypename': 'OFFICE',
          'phone': '(555) 946-3582',
          'ecommercecreditcardtypes': ['AX', 'DS', 'MC', 'VI'],
          'zip': '12020', 'communicatorbrandid': '1'
        }
      ]
    }
  end

  subject { AthenaHealth::DepartmentCollection.new(department_collection_attributes) }

  it_behaves_like 'a collection'

  it 'has practiceinfo Array[Department] attribute' do
    expect(subject.departments.map(&:class)).to eq [AthenaHealth::Department]
  end
end
