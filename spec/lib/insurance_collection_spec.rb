require 'spec_helper'

describe AthenaHealth::InsuranceCollection do
  let(:insurance_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'insurances': [
        {
          'affiliations': ['ACP Mercy', 'HealthSCOPE Benefits', 'Walmart'],
          'insuranceplanname': 'HealthSCOPE Benefits - ACP Mercy (PPO)',
          'insurancepackageid': '352029',
          'addresslist': ['PO BOX 16367  LUBBOCK TX 79490-6367']
        }
      ],
      'totalcount': 1,
    }
  end

  subject { AthenaHealth::InsuranceCollection.new(insurance_collection_attributes) }
  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.insurances.map(&:class)).to eq [AthenaHealth::Insurance]
  end
end
