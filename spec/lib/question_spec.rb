require 'spec_helper'

describe AthenaHealth::Question do
  let(:question_attributes) do
    {
      'question': 'dementia',
      'answer': 'N',
      'questionid': '101',
      'templateid': '78',
      'key': 'ADVANCEDIRECTIVE',
      'ordering': '11',
      'lastupdated': '05/19/2016'
    }
  end

  subject { AthenaHealth::Question.new(question_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      question: 'dementia',
      answer: 'N',
      questionid: 101,
      templateid: 78,
      key: 'ADVANCEDIRECTIVE',
      ordering: 11,
      lastupdated: '05/19/2016'
    )
  end
end
