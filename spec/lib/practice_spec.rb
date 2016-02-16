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

  it 'has hascommunicator Boolean attribute' do
    expect(subject.hascommunicator).to eq true
  end

  it 'has iscoordinatorsender Boolean attribute' do
    expect(subject.iscoordinatorsender).to eq false
  end

  it 'has iscoordinatorreceiver Boolean attribute' do
    expect(subject.iscoordinatorreceiver).to eq false
  end

  it 'has hasclinicals Boolean attribute' do
    expect(subject.hasclinicals).to eq true
  end

  it 'has name String attribute' do
    expect(subject.name).to eq 'athenahealth MDP Sandbox'
  end

  it 'has hascollector Boolean attribute' do
    expect(subject.hascollector).to eq true
  end

  it 'has publicnames Array attribute' do
    expect(subject.publicnames).to eq ['Communicator Care Team']
  end

  it 'has practiceid Integer attribute' do
    expect(subject.practiceid).to eq 195_900
  end
end
