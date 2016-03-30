require 'spec_helper'

describe AthenaHealth::OrderCollection do
  let(:order_collection_attributes) do
    {
      'orders': [{
        'status': 'REVIEW',
        'description': 'Ankle Brace',
        'documentid': '116881',
        'documentationonly': 'false',
        'classdescription': 'durable medical equipment',
        'orderingprovider': 'khaworth0',
        'assigneduser': 'khaworth0',
        'ordertype': 'DME',
        'documents': []
      }],
      'diagnosis': 'Carpal tunnel syndrome',
      'diagnosissnomed': '57406009'
    }
  end

  subject { AthenaHealth::OrderCollection.new(order_collection_attributes) }

  it 'have proper attributes' do
    expect(subject.orders.map(&:class)).to eq [AthenaHealth::Order]
    expect(subject).to have_attributes(
      diagnosis: 'Carpal tunnel syndrome',
      diagnosissnomed: '57406009'
    )
  end
end
