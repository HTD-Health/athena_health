require 'spec_helper'

describe AthenaHealth::PracticeCollection do
  let(:practice_collection_attributes) do
    {
      'totalcount': 1,
      'practiceinfo': [
        {
          'hascommunicator': 'true',
          'iscoordinatorsender': 'false',
          'iscoordinatorreceiver': 'false',
          'hasclinicals': 'true',
          'name': 'athenahealth MDP Sandbox',
          'hascollector': 'true',
          'practiceid': '195900'
        }
      ]
    }
  end

  let(:practice_collection) { AthenaHealth::PracticeCollection.new(practice_collection_attributes) }

  it 'has totalcount Integer attribute' do
    expect(practice_collection.totalcount).to eq 1
  end

  it 'has practiceinfo Array[Practice] attribute' do
    expect(practice_collection.practiceinfo.map(&:class)).to eq [AthenaHealth::Practice]
  end
end
