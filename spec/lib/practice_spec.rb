require 'spec_helper'

describe AthenaHealth::Practice do
  let(:practice_attributes) do
    {
      'hascommunicator': 'true',
      'iscoordinatorsender': 'false',
      'iscoordinatorreceiver': 'false',
      'hasclinicals': 'true',
      'name': 'athenahealth MDP Sandbox',
      'hascollector': 'true',
      'publicnames': ['Communicator Care Team'],
      'practiceid': '195900'
    }
  end

  subject { AthenaHealth::Practice.new(practice_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      hascommunicator: true,
      iscoordinatorsender: false,
      iscoordinatorreceiver: false,
      hasclinicals: true,
      name: 'athenahealth MDP Sandbox',
      hascollector: true,
      publicnames: ['Communicator Care Team'],
      practiceid: 195900
    )
  end
end
