require 'spec_helper'

describe AthenaHealth::Allergy do
  let(:order_type_attributes) do
    {
      'ordertypeid': '123456',
      'name': 'Some name'
    }
  end

  subject { AthenaHealth::OrderType.new(order_type_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
                         ordertypeid: 123456,
                         name: 'Some name'
                       )
  end
end
