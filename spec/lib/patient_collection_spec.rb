require 'spec_helper'

describe AthenaHealth::PatientCollection do
  let(:patient_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'patients': [
        {
          'email': 'monroe86@hotmail.com',
          'occupationcode': nil,
          'departmentid': '162',
          'homephone': '6102569611',
          'guarantorstate': 'GA',
          'driverslicense': 'false',
          'workphone': '7257089299',
          'ethnicitycode': nil,
          'industrycode': nil,
          'contacthomephone': nil,
          'guarantorssn': '*****6481',
          'guarantordob': '11/24/1976',
          'zip': '13323-6882',
          'guarantoraddresssameaspatient': 'false',
          'employerphone': nil,
          'contactmobilephone': nil,
          'nextkinphone': nil,
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
          'language6392code': nil,
          'primaryproviderid': '',
          'patientphoto': 'false',
          'caresummarydeliverypreference': nil,
          'guarantorlastname': 'West',
          'firstname': 'Etha',
          'guarantorcountrycode': 'USA',
          'state': 'CO',
          'patientid': '5309',
          'dob': '12/05/1937',
          'guarantorrelationshiptopatient': '13',
          'address1': '198 Emard Cove Apt. 230',
          'guarantorphone': nil,
          'countrycode': 'USA',
          'guarantoraddress1': '740 Pauline Mission',
          'consenttotext': 'false',
          'countrycode3166': 'US',
          'guarantorcountrycode3166': 'US'
        }
      ],
      'totalcount': 1
    }
  end

  subject { AthenaHealth::PatientCollection.new(patient_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.patients.map(&:class)).to eq [AthenaHealth::Patient]
  end
end
