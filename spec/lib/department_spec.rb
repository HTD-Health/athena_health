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
      'communicatorbrandid': '1'
    }
  end

  subject { AthenaHealth::Department.new(department_attributes) }

  it_behaves_like 'a model'

  it 'has creditcardtypes Array attribute' do
    expect(subject.creditcardtypes).to eq ['AX', 'DS', 'MC', 'VI']
  end

  it 'has medicationhistoryconsent Boolean attribute' do
    expect(subject.medicationhistoryconsent).to eq false
  end

  it 'has timezoneoffset Fixnum attribute' do
    expect(subject.timezoneoffset).to eq -5
  end

  it 'has providergroupid Integer attribute' do
    expect(subject.providergroupid).to eq 1
  end

  it 'has singleappointmentcontractmax Integer attribute' do
    expect(subject.singleappointmentcontractmax).to eq 3000
  end

  it 'has state String attribute' do
    expect(subject.state).to eq 'NY'
  end

  it 'has portalurl String attribute' do
    expect(subject.portalurl).to eq '1959-1-practice-home-url'
  end

  it 'has city String attribute' do
    expect(subject.city).to eq 'BALLSTON SPA'
  end

  it 'has placeofservicefacility String attribute' do
    expect(subject.placeofservicefacility).to eq false
  end

  it 'has oneyearcontractmax Integer attribute' do
    expect(subject.oneyearcontractmax).to eq 1500
  end

  it 'has providergroupname String attribute' do
    expect(subject.providergroupname).to eq 'Downtown Health Group'
  end

  it 'has doesnotobservedst Boolean attribute' do
    expect(subject.doesnotobservedst).to eq false
  end

  it 'has departmentid Integer attribute' do
    expect(subject.departmentid).to eq 162
  end

  it 'has address String attribute' do
    expect(subject.address).to eq '8762 STONERIDGE CT'
  end

  it 'has clinicals String attribute' do
    expect(subject.clinicals).to eq 'OFF'
  end

  it 'has timezone Fixnum attribute' do
    expect(subject.timezone).to eq -5
  end

  it 'has patientdepartmentname String attribute' do
    expect(subject.patientdepartmentname).to eq 'Main Office'
  end

  it 'has name String attribute' do
    expect(subject.name).to eq 'MERCY HOSPITAL'
  end

  it 'has placeofservicetypename String attribute' do
    expect(subject.placeofservicetypename).to eq 'OFFICE'
  end

  it 'has phone String attribute' do
    expect(subject.phone).to eq '(555) 946-3582'
  end

  it 'has ecommercecreditcardtypes Array attribute' do
    expect(subject.ecommercecreditcardtypes).to eq ['AX', 'DS', 'MC', 'VI']
  end

  it 'has communicatorbrandid Integer attribute' do
    expect(subject.communicatorbrandid).to eq 1
  end
end
