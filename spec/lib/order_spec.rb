require 'spec_helper'

describe AthenaHealth::Order do
  let(:order_attributes) do
    {
      'status': 'REVIEW',
      'description': 'Ankle Brace',
      'documentid': '116881',
      'documentationonly': 'false',
      'classdescription': 'durable medical equipment',
      'orderingprovider': 'khaworth0',
      'assigneduser': 'khaworth0',
      'dateordered': '03\/30\/2016 05:46 AM',
      'ordertype': 'DME',
      'documents': []
    }
  end

  subject { AthenaHealth::Order.new(order_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      status: 'REVIEW',
      description: 'Ankle Brace',
      documentid: 116881,
      documentationonly: false,
      classdescription: 'durable medical equipment',
      orderingprovider: 'khaworth0',
      assigneduser: 'khaworth0',
      dateordered: '03\/30\/2016 05:46 AM',
      ordertype: 'DME',
      documents: []
    )
  end
end
