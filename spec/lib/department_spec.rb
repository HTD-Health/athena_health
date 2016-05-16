require 'spec_helper'

describe AthenaHealth::Practice do
  let(:department_attributes) do
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
      'zip': '12020',
      'communicatorbrandid': '1',
      'providerlist': ['1', '2']
    }
  end

  subject { AthenaHealth::Department.new(department_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      creditcardtypes: ['AX', 'DS', 'MC', 'VI'],
      medicationhistoryconsent: false,
      timezoneoffset: -5,
      providergroupid: 1,
      singleappointmentcontractmax: 3000,
      state: 'NY',
      portalurl: '1959-1-practice-home-url',
      city: 'BALLSTON SPA',
      placeofservicefacility: false,
      oneyearcontractmax: 1500,
      providergroupname: 'Downtown Health Group',
      doesnotobservedst: false,
      departmentid: 162,
      address: '8762 STONERIDGE CT',
      placeofservicetypeid: 11,
      clinicals: 'OFF',
      timezone: -5,
      patientdepartmentname: 'Main Office',
      name: 'MERCY HOSPITAL',
      placeofservicetypename: 'OFFICE',
      phone: '(555) 946-3582',
      ecommercecreditcardtypes: ['AX', 'DS', 'MC', 'VI'],
      zip: '12020',
      communicatorbrandid: 1,
      providerlist: ['1', '2']
    )
  end
end
