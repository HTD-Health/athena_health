require 'spec_helper'

describe AthenaHealth::Insurance do
  let(:insurance_attributes) do
    {
      'affiliations': ['ACP Mercy', 'HealthSCOPE Benefits', 'Walmart'],
      'insuranceplanname': 'HealthSCOPE Benefits - ACP Mercy (PPO)',
      'insurancepackageid': '352029',
      'addresslist': ['PO BOX 16367  LUBBOCK TX 79490-6367']
    }
  end

  subject { AthenaHealth::Insurance.new(insurance_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      affiliations: ['ACP Mercy', 'HealthSCOPE Benefits', 'Walmart'],
      insuranceplanname: 'HealthSCOPE Benefits - ACP Mercy (PPO)',
      insurancepackageid: 352029,
      addresslist: ['PO BOX 16367  LUBBOCK TX 79490-6367']
    )
  end
end
