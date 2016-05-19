require 'spec_helper'

describe AthenaHealth::SocialHistory do
  let(:social_history_attributes) do
    {
      'questions': [
        {
          'answer': 'YES',
          'templateid': '78',
          'key': 'ADVANCEDIRECTIVE',
          'question': 'Advance directive',
          'ordering': '11',
          'lastupdated': '05/19/2016',
          'questionid': '65'
        }
      ],
      'templates': [
        {
          'templatename': 'Urology',
          'templateid': '78'
        }
      ]
    }
  end

  subject { AthenaHealth::SocialHistory.new(social_history_attributes) }

  it 'have proper attributes' do
    expect(subject.questions.map(&:class)).to eq [AthenaHealth::Question]
    expect(subject.templates.map(&:class)).to eq [AthenaHealth::Template]
  end
end
