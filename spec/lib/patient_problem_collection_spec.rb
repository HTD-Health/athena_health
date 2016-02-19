require 'spec_helper'

describe AthenaHealth::PatientProblemCollection do
  let(:patient_problem_collection_attributes) do
    {
      'totalcount': 1,
      'problems': [
        {
          'problemid': '7075',
          'events': []
        }
      ],
    }
  end

  subject { AthenaHealth::PatientProblemCollection.new(patient_problem_collection_attributes) }

  it 'have proper attributes' do
    expect(subject).to_not have_attributes(
      next: 'next_page_url',
      previous: 'previous_page_url',
    )

    expect(subject).to have_attributes(
      totalcount: 1,
    )

    expect(subject.problems.map(&:class)).to eq [AthenaHealth::PatientProblem]
  end
end
