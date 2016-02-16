require 'spec_helper'

describe AthenaHealth::Patient do
  let(:patient_attributes) do
    {
      'email': 'monroe86@hotmail.com',
      'occupationcode': '123.123',
      'departmentid': '162',
      'homephone': '6102569611',
      'guarantorstate': 'GA',
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
      'guarantorphone': '123',
      'countrycode': 'USA',
      'guarantoraddress1': '740 Pauline Mission',
      'consenttotext': 'false',
      'countrycode3166': 'US',
      'guarantorcountrycode3166': 'US'
    }
  end

  subject { AthenaHealth::Patient.new(patient_attributes) }

  it_behaves_like 'a model'

  it 'has email String attribute' do
    expect(subject.email).to eq 'monroe86@hotmail.com'
  end

  it 'has occupationcode String attribute' do
    expect(subject.occupationcode).to eq '123.123'
  end

  it 'has departmentid Integer attribute' do
    expect(subject.departmentid).to eq 162
  end

  it 'has homephone String attribute' do
    expect(subject.homephone).to eq '6102569611'
  end

  it 'has guarantorstate String attribute' do
    expect(subject.guarantorstate).to eq 'GA'
  end

  it 'has driverslicense Boolean attribute' do
    expect(subject.driverslicense).to eq false
  end

  it 'has workphone String attribute' do
    expect(subject.workphone).to eq '7257089299'
  end

  it 'has ethnicitycode String attribute' do
    expect(subject.ethnicitycode).to eq '123'
  end

  it 'has industrycode String attribute' do
    expect(subject.industrycode).to eq '1234'
  end

  it 'has contacthomephone String attribute' do
    expect(subject.contacthomephone).to eq '12341234'
  end

  it 'has guarantorssn String attribute' do
    expect(subject.guarantorssn).to eq '*****6481'
  end

  it 'has guarantordob String attribute' do
    expect(subject.guarantordob).to eq '11/24/1976'
  end

  it 'has zip String attribute' do
    expect(subject.zip).to eq '13323-6882'
  end

  it 'has guarantoraddresssameaspatient String attribute' do
    expect(subject.guarantoraddresssameaspatient).to eq false
  end

  it 'has employerphone String attribute' do
    expect(subject.employerphone).to eq '123321'
  end

  it 'has contactmobilephone String attribute' do
    expect(subject.contactmobilephone).to eq '123231'
  end

  it 'has nextkinphone String attribute' do
    expect(subject.nextkinphone).to eq '123123'
  end

  it 'has portaltermsonfile Boolean attribute' do
    expect(subject.portaltermsonfile).to eq false
  end

  it 'has status String attribute' do
    expect(subject.status).to eq 'active'
  end

  it 'has lastname String attribute' do
    expect(subject.lastname).to eq 'McCullough'
  end

  it 'has guarantorfirstname String attribute' do
    expect(subject.guarantorfirstname).to eq 'Nicklaus'
  end

  it 'has city String attribute' do
    expect(subject.city).to eq 'DEVYNMOUTH'
  end

  it 'has ssn String attribute' do
    expect(subject.ssn).to eq '*****4181'
  end

  it 'has guarantoremail String attribute' do
    expect(subject.guarantoremail).to eq 'jacky.dubuque@gmail.com'
  end

  it 'has guarantorcity String attribute' do
    expect(subject.guarantorcity).to eq 'SOUTH GREGORYMOUTH'
  end

  it 'has guarantorzip String attribute' do
    expect(subject.guarantorzip).to eq '96049'
  end

  it 'has privacyinformationverified Boolean attribute' do
    expect(subject.privacyinformationverified).to eq false
  end

  it 'has primarydepartmentid Integer attribute' do
    expect(subject.primarydepartmentid).to eq 162
  end

  it 'has balances Array[Ballance] attribute' do
    expect(subject.balances.map(&:class)).to eq [AthenaHealth::Balance]
  end

  it 'has race Array attribute' do
    expect(subject.race).to eq []
  end

  it 'has language6392code String attribute' do
    expect(subject.language6392code).to eq '123'
  end

  it 'has primaryproviderid String attribute' do
    expect(subject.primaryproviderid).to eq 2
  end

  it 'has patientphoto Boolean attribute' do
    expect(subject.patientphoto).to eq false
  end

  it 'has caresummarydeliverypreference String attribute' do
    expect(subject.caresummarydeliverypreference).to eq 'test'
  end

  it 'has guarantorlastname String attribute' do
    expect(subject.guarantorlastname).to eq 'West'
  end

  it 'has firstname String attribute' do
    expect(subject.firstname).to eq 'Etha'
  end

  it 'has guarantorcountrycode String attribute' do
    expect(subject.guarantorcountrycode).to eq 'USA'
  end

  it 'has state String attribute' do
    expect(subject.state).to eq 'CO'
  end

  it 'has patientid Integer attribute' do
    expect(subject.patientid).to eq 5309
  end

  it 'has dob String attribute' do
    expect(subject.dob).to eq '12/05/1937'
  end

  it 'has guarantorrelationshiptopatient Integer attribute' do
    expect(subject.guarantorrelationshiptopatient).to eq 13
  end

   it 'has address1 String attribute' do
    expect(subject.address1).to eq '198 Emard Cove Apt. 230'
  end

  it 'has guarantorphone String attribute' do
    expect(subject.guarantorphone).to eq '123'
  end

  it 'has countrycode String attribute' do
    expect(subject.countrycode).to eq 'USA'
  end

  it 'has guarantoraddress1 String attribute' do
    expect(subject.guarantoraddress1).to eq '740 Pauline Mission'
  end

  it 'has consenttotext Boolean attribute' do
    expect(subject.consenttotext).to eq false
  end

  it 'has countrycode3166 String attribute' do
    expect(subject.countrycode3166).to eq 'US'
  end

  it 'has guarantorcountrycode3166 String attribute' do
    expect(subject.guarantorcountrycode3166).to eq 'US'
  end
end
