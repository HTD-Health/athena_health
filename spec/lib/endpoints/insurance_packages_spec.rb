require 'spec_helper'

describe AthenaHealth::Endpoints::InsurancePackages do
  describe '#top_insurance_packages' do
    let(:attributes) { { practice_id: 195_900 } }

    it 'returns instance of InsutancePackageCollection' do
      VCR.use_cassette('top_insurance_packages') do
        expect(client.top_insurance_packages(attributes))
          .to be_an_instance_of AthenaHealth::InsurancePackageCollection
      end
    end
  end
end
