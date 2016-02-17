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
    let(:attributes) { { practice_id: 195_900 } }

    it 'returns instance of Practice' do
      VCR.use_cassette('find_practice') do
        expect(client.find_practice(attributes)).to be_an_instance_of AthenaHealth::Practice
      end
    end
  end

  describe '#all_departments' do
    let(:attributes) { { practice_id: 195_900 } }

    it 'returns instance of DepartmentCollection' do
      VCR.use_cassette('all_departments') do
        expect(client.all_departments(attributes)).to be_an_instance_of AthenaHealth::DepartmentCollection
      end
    end
  end

  describe '#find_department' do
    let(:attributes) { { practice_id: 195_900, department_id: 162 } }

    it 'returns instance of Department' do
      VCR.use_cassette('find_department') do
        expect(client.find_department(attributes)).to be_an_instance_of AthenaHealth::Department
      end
    end
  end

  describe '#all_patients' do
    let(:attributes) { { practice_id: 195_900, department_id: 162 } }

    it 'returns instance of PatientCollection' do
      VCR.use_cassette('all_patients') do
        expect(client.all_patients(attributes)).to be_an_instance_of AthenaHealth::PatientCollection
      end
    end
  end

  describe '#find_patient' do
    let(:attributes) { { practice_id: 195_900, patient_id: 5309 } }

    it 'returns instance of Patient' do
      VCR.use_cassette('find_patient') do
        expect(client.find_patient(attributes)).to be_an_instance_of AthenaHealth::Patient
      end
    end
  end


  describe '#create_patient' do
    context 'with wrong data' do
      let(:attributes) { { practice_id: 195_900, department_id: 162 } }

      it 'returns Array of errors' do
        VCR.use_cassette('create_patient_with_wrong_data') do
          expect(client.create_patient(attributes))
            .to eq('invalidfields' => [], 'missingfields' => %w(lastname dob firstname), 'error' => 'Additional fields are required.')
        end
      end
    end

    context 'with wrong formatted_data' do
      let(:attributes) do
        {
          practice_id: 195_900, department_id: 1,
          params: { firstname: 'Mateusz', lastname: 'U.', emai: 'mat@u.com', dob: 'wrong date' }
        }
      end

      it 'returns Hash with error information' do
        VCR.use_cassette('create_patient_with_wrong_formatted_data') do
          expect(client.create_patient(attributes)).to eq 'error' => 'Improper DOB.'
        end
      end
    end
  end

  describe '#update_patient' do
    let(:attributes) { { practice_id: 195_900, patient_id: 5309, params: { lastname: 'Urb.' } } }

    it 'returns patientid of updated Patient' do
      VCR.use_cassette('update_patient') do
        expect(client.update_patient(attributes)).to eq [{ 'patientid' => '5309' }]
      end
    end
  end

  describe '#delete_patient' do
    let(:attributes) { { practice_id: 195_900, patient_id: 5309 } }

    it 'returns patientid of deleted Patient' do
      VCR.use_cassette('delete_patient') do
        expect(client.delete_patient(attributes)).to eq [{ 'patientid' => '5309' }]
      end
    end
  end
end
