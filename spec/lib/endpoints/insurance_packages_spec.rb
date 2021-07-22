require 'spec_helper'

describe AthenaHealth::Endpoints::InsurancePackages do
  let(:attributes) { { practice_id: 195900 } }
  describe '#top_insurance_packages' do
    it 'returns instance of InsurancePackageCollection' do
      VCR.use_cassette('top_insurance_packages') do
        expect(client.top_insurance_packages(**attributes))
          .to be_an_instance_of AthenaHealth::InsurancePackageCollection
      end
    end
  end

    describe '#common_insurance_packages' do
      it 'returns instance of InsurancePackageCollection' do
        VCR.use_cassette('common_insurance_packages') do
          expect(client.common_insurance_packages(practice_id: 195900, params: {departmentid: 1}))
            .to be_an_instance_of AthenaHealth::InsurancePackageCollection
        end
    end
  end
end
