require 'spec_helper'

describe AthenaHealth::Event do
  let(:event_attributes) do
    {
      'source': 'HISTORY',
      'eventtype': 'START',
      'startdate': '02\/19\/2016',
      'diagnoses': []
    }
  end

  subject { AthenaHealth::Event.new(event_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      source: 'HISTORY',
      eventtype: 'START',
      startdate: '02\/19\/2016',
      diagnoses: []
    )
  end
end
