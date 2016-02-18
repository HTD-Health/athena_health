require 'spec_helper'

describe AthenaHealth::Patient do
  let(:patient_attributes) do
    {
      'email': 'monroe86@hotmail.com',
      'occupationcode': '123.123',
      'departmentid': '162',
      'homephone': '6102569611',
      'guarantorstate': 'GA',
      'portalaccessgiven': 'false',
      'driverslicense': 'false',
      'workphone': '7257089299',
      'ethnicitycode': '123',
      'industrycode': '1234',
      'contacthomephone': '12341234',
      'guarantorssn': '*****6481',
      'guarantordob': '11/24/1976',
      'zip': '13323-6882',
      'guarantoraddresssameaspatient': 'false',
      'employerphone': '123321',
      'contactmobilephone': '123231',
      'nextkinphone': '123123',
      'portaltermsonfile': 'false',
      'status': 'active',
      'lastname': 'McCullough',
      'guarantorfirstname': 'Nicklaus',
      'city': 'DEVYNMOUTH',
      'ssn': '*****4181',
      'guarantoremail': 'jacky.dubuque@gmail.com',
      'guarantorcity': 'SOUTH GREGORYMOUTH',
      'guarantorzip': '96049',
      'privacyinformationverified': 'false',
      'primarydepartmentid': '162',
      'balances': [
        {
          'balance': 0,
          'departmentlist': '1,21,102,145,148,150,157,162',
          'providergroupid': '1',
          'cleanbalance': 'true'
        }
      ],
      'race': [],
      'language6392code': '123',
      'primaryproviderid': '2',
      'patientphoto': 'false',
      'caresummarydeliverypreference': 'test',
      'guarantorlastname': 'West',
      'firstname': 'Etha',
      'guarantorcountrycode': 'USA',
      'state': 'CO',
      'patientid': '5309',
      'dob': '12/05/1937',
      'guarantorrelationshiptopatient': '13',
      'address1': '198 Emard Cove Apt. 230',
      'address2': 'Basement',
      'guarantorphone': '123',
      'countrycode': 'USA',
      'guarantoraddress1': '740 Pauline Mission',
      'guarantoraddress2': '740 NYC',
      'consenttotext': 'false',
      'countrycode3166': 'US',
      'guarantorcountrycode3166': 'US'
    }
  end

  subject { AthenaHealth::Patient.new(patient_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      email: 'monroe86@hotmail.com',
      occupationcode: '123.123',
      departmentid: 162,
      homephone: '6102569611',
      guarantorstate: 'GA',
      portalaccessgiven: false,
      driverslicense: false,
      workphone: '7257089299',
      ethnicitycode: '123',
      industrycode: '1234',
      contacthomephone: '12341234',
      guarantorssn: '*****6481',
      guarantordob: '11/24/1976',
      zip: '13323-6882',
      guarantoraddresssameaspatient: false,
      employerphone: '123321',
      contactmobilephone: '123231',
      nextkinphone: '123123',
      portaltermsonfile: false,
      status: 'active',
      lastname: 'McCullough',
      guarantorfirstname: 'Nicklaus',
      city: 'DEVYNMOUTH',
      ssn: '*****4181',
      guarantoremail: 'jacky.dubuque@gmail.com',
      guarantorcity: 'SOUTH GREGORYMOUTH',
      guarantorzip: '96049',
      privacyinformationverified: false,
      primarydepartmentid: 162,
      race: [],
      language6392code: '123',
      primaryproviderid: 2,
      patientphoto: false,
      caresummarydeliverypreference: 'test',
      guarantorlastname: 'West',
      firstname: 'Etha',
      guarantorcountrycode: 'USA',
      state: 'CO',
      patientid: 5309,
      dob: '12/05/1937',
      guarantorrelationshiptopatient: 13,
      address1: '198 Emard Cove Apt. 230',
      address2: 'Basement',
      guarantorphone: '123',
      countrycode: 'USA',
      guarantoraddress1: '740 Pauline Mission',
      guarantoraddress2: '740 NYC',
      consenttotext: false,
      countrycode3166: 'US',
      guarantorcountrycode3166: 'US'
    )

    expect(subject.balances.map(&:class)).to eq [AthenaHealth::Balance]
  end
end
