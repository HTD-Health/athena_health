require 'spec_helper'

describe AthenaHealth::PracticeCollection do
  let(:practice_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
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
      ],
      'totalcount': 1,
    }
  end

  subject { AthenaHealth::PracticeCollection.new(practice_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.practices.map(&:class)).to eq [AthenaHealth::Practice]
  end
end
