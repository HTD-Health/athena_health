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

  let(:practice) { AthenaHealth::Practice.new(practice_attributes) }

  it 'has hascommunicator Boolean attribute' do
    expect(practice.hascommunicator).to eq true
  end

  it 'has iscoordinatorsender Boolean attribute' do
    expect(practice.iscoordinatorsender).to eq false
  end

  it 'has iscoordinatorreceiver Boolean attribute' do
    expect(practice.iscoordinatorreceiver).to eq false
  end

  it 'has hasclinicals Boolean attribute' do
    expect(practice.hasclinicals).to eq true
  end

  it 'has name String attribute' do
    expect(practice.name).to eq 'athenahealth MDP Sandbox'
  end

  it 'has hascollector Boolean attribute' do
    expect(practice.hascollector).to eq true
  end

  it 'has publicnames Array attribute' do
    expect(practice.publicnames).to eq ['Communicator Care Team']
  end

  it 'has practiceid Integer attribute' do
    expect(practice.practiceid).to eq 195_900
  end
end
