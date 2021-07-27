require 'spec_helper'

describe AthenaHealth::Endpoints::Departments do
  describe '#all_departments' do
    let(:attributes) { { practice_id: 195_900 } }

    it 'returns instance of DepartmentCollection' do
      VCR.use_cassette('all_departments') do
        expect(client.all_departments(**attributes))
          .to be_an_instance_of AthenaHealth::DepartmentCollection
      end
    end
  end

  describe '#find_department' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 162
      }
    end

    it 'returns instance of Department' do
      VCR.use_cassette('find_department') do
        expect(client.find_department(**attributes))
          .to be_an_instance_of AthenaHealth::Department
      end
    end
  end
end
