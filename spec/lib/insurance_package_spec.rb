require 'spec_helper'

describe AthenaHealth::InsurancePackage do
  let(:insurance_package_attributes) do
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
  end

  subject { AthenaHealth::InsurancePackage.new(insurance_package_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      ranking: 2,
      name: 'HUMANA (PPO)',
      percentage: 43.986543313709,
      phone: '(800) 558-4444',
      insuranceproducttypename: 'PPO',
      state: 'KY',
      zip: '40512-4601',
      city: 'LEXINGTON',
      insurancepackageid: 31724,
      address: 'PO BOX 14601'
    )
  end
end
