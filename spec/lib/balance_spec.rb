require 'spec_helper'

describe AthenaHealth::Balance do
  let(:balance_attributes) do
    {
      'balance': 0,
      'departmentlist': '1,21',
      'providergroupid': '1',
      'cleanbalance': 'true'
    }
  end

  subject { AthenaHealth::Balance.new(balance_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      balance: 0,
      departmentlist: '1,21',
      providergroupid: 1,
      cleanbalance: true
    )
  end
end
