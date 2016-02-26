require 'spec_helper'

describe AthenaHealth::InsurancePackageCollection do
  let(:insurance_package_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'insurancepackages': [
        {
          'ranking': '2',
          'name': 'HUMANA (PPO)',
          'percentage': '43.98654331370899915895710681244743481918',
          'phone': '(800) 558-4444',
          'insuranceproducttypename': 'PPO',
          'state': 'KY',
          'zip': '40512-4601',
          'city': 'LEXINGTON',
          'insurancepackageid': '31724',
          'address': 'PO BOX 14601'
        }
      ],
      'totalcount': 1,
    }
  end

  subject { AthenaHealth::InsurancePackageCollection.new(insurance_package_collection_attributes) }
  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.insurancepackages.map(&:class)).to eq [AthenaHealth::InsurancePackage]
  end
end
