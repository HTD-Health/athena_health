require 'spec_helper'

describe AthenaHealth::Client do
  let(:client) { AthenaHealth::Client.new(version: 'preview1', key: 'test_key', secret: 'test_secret') }

  describe '#initialize' do
    it 'creates new instance of AthenaHealth::Connection' do
      expect(AthenaHealth::Connection).to receive(:new).with(version: 'preview1', key: 'test_key', secret: 'test_secret')

      client
    end
  end

  describe '#all_practices' do
    it 'returns instance of  PracticeCollection' do
      VCR.use_cassette('all_practices') do
        expect(client.all_practices).to be_an_instance_of AthenaHealth::PracticeCollection
      end
    end
  end

  describe '#find_practice' do
    it 'returns instance of Practice' do
      VCR.use_cassette('find_practice') do
        expect(client.find_practice(practice_id: 195900)).to be_an_instance_of AthenaHealth::Practice
      end
    end
  end

  describe '#all_departments' do
    it 'returns instance of DepartmentCollection' do
      VCR.use_cassette('all_departments') do
        expect(client.all_departments(practice_id: 195900)).to be_an_instance_of AthenaHealth::DepartmentCollection
      end
    end
  end

  describe '#find_department' do
    it 'returns instance of Department' do
      VCR.use_cassette('find_department') do
        expect(client.find_department(practice_id: 195900, department_id: 162)).to be_an_instance_of AthenaHealth::Department
      end
    end
  end

  describe '#all_patients' do
    it 'returns instance of PatientCollection' do
      VCR.use_cassette('all_patients') do
        expect(client.all_patients(practice_id: 195900, department_id: 162)).to be_an_instance_of AthenaHealth::PatientCollection
      end
    end
  end
end
