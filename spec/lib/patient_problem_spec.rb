require 'spec_helper'

describe AthenaHealth::PatientProblem do
  let(:patient_problem_attributes) do
    {
      'problemid': '7075',
      'events': [
        {
          'source': 'HISTORY',
          'eventtype': 'START',
          'startdate': '02\/19\/2016',
          'diagnoses': []
        }
      ],
      'codeset': 'SNOMED',
      'name': 'Carpal tunnel syndrome',
      'code': '57406009'
    }
  end

  subject { AthenaHealth::PatientProblem.new(patient_problem_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      problemid: 7075,
      codeset: 'SNOMED',
      name: 'Carpal tunnel syndrome',
      code: 574_060_09
    )

    expect(subject.events.map(&:class)).to eq [AthenaHealth::Event]
  end
end
