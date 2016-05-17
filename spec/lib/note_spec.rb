require 'spec_helper'

describe AthenaHealth::Note do
  let(:note_attributes) do
    {
      'notetext': 'Test note',
      'noteid': '40341',
      'created': '05/17/2016 08:20:08',
      'createdby': 'API'
    }
  end

  subject { AthenaHealth::Note.new(note_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      notetext: 'Test note',
      noteid: 40341,
      created: '05/17/2016 08:20:08',
      createdby: 'API'
    )
  end
end
