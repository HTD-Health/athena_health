require 'spec_helper'

describe AthenaHealth::NoteCollection do
  let(:note_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'notes': [{
        'notetext': 'Test note',
        'noteid': '40341',
        'created': '05/17/2016 08:20:08',
        'createdby': 'API'
      }],
      'totalcount': 1
    }
  end

  subject { AthenaHealth::NoteCollection.new(note_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.notes.map(&:class)).to eq [AthenaHealth::Note]
  end
end
