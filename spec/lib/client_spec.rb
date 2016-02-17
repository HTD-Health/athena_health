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
        expect(client.find_practice(practice_id: 195_900)).to be_an_instance_of AthenaHealth::Practice
      end
    end
  end

  describe '#all_departments' do
    it 'returns instance of DepartmentCollection' do
      VCR.use_cassette('all_departments') do
        expect(client.all_departments(practice_id: 195_900)).to be_an_instance_of AthenaHealth::DepartmentCollection
      end
    end
  end

  describe '#find_department' do
    it 'returns instance of Department' do
      VCR.use_cassette('find_department') do
        expect(client.find_department(practice_id: 195_900, department_id: 162)).to be_an_instance_of AthenaHealth::Department
      end
    end
  end

  describe '#all_patients' do
    it 'returns instance of PatientCollection' do
      VCR.use_cassette('all_patients') do
        expect(client.all_patients(practice_id: 195_900, department_id: 162)).to be_an_instance_of AthenaHealth::PatientCollection
      end
    end
  end

  describe '#find_patient' do
    it 'returns instance of Patient' do
      VCR.use_cassette('find_patient') do
        expect(client.find_patient(practice_id: 195_900, patient_id: 5309)).to be_an_instance_of AthenaHealth::Patient
      end
    end
  end

  describe '#delete_patient' do
    it 'returns patientid of deleted Patient' do
      VCR.use_cassette('delete_patient') do
        expect(client.delete_patient(practice_id: 195_900, patient_id: 5309)).to eq [{ 'patientid' => '5309' }]
      end
    end
  end

  describe '#create_patient' do
    context 'with wrong data' do
      it 'returns Array of errors' do
        VCR.use_cassette('create_patient_with_wrong_data') do
          expect(client.create_patient(practice_id: 195_900, department_id: 1))
            .to eq('invalidfields' => [], 'missingfields' => %w(lastname dob firstname), 'error' => 'Additional fields are required.')
        end
      end
    end

    context 'with wrong formatted_data' do
      it 'returns Array of errors' do
        VCR.use_cassette('create_patient_with_wrong_formatted_data') do
          expect(client.create_patient(practice_id: 195_900, department_id: 1, params: { firstname: 'Mateusz', lastname: 'U.', emai: 'mat@u.com', dob: 'wrong date'}))
            .to eq "error" => "Improper DOB."
        end
      end
    end
  end
end
