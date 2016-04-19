require 'spec_helper'

describe AthenaHealth::Endpoints::Configurations do
  describe '#all_facilities' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        order_type: 'PRESCRIPTION',
        params: {
          name: 'New York'
        }
      }
    end

    it 'returns array of Facility instances' do
      VCR.use_cassette('all_facilities') do
        facilities = client.all_facilities(parameters)
        expect(facilities.map(&:class).uniq).to eq [AthenaHealth::Facility]
      end
    end
  end
end
