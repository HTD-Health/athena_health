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

  it 'has balance Integer attribute' do
    expect(subject.balance).to eq 0
  end

  it 'has departmentlist String attribute' do
    expect(subject.departmentlist).to eq '1,21'
  end

  it 'has providergroupid String attribute' do
    expect(subject.providergroupid).to eq 1
  end

  it 'has cleanbalance Boolean attribute' do
    expect(subject.cleanbalance).to eq true
  end
end
