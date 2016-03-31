require 'spec_helper'

describe AthenaHealth::QuestionCollection do
  let(:question_collection_attributes) do
    {
      'questions': [{
        'question': 'dementia',
        'answer': 'N',
        'questionid': '101'
      }],
    }
  end

  subject { AthenaHealth::QuestionCollection.new(question_collection_attributes) }

  it 'have proper attributes' do
    expect(subject.questions.map(&:class)).to eq [AthenaHealth::Question]
  end
end
