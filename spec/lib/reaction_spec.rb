require 'spec_helper'

describe AthenaHealth::Reaction do
  let(:reaction_attributes) do
    {
      'reactionname': 'anaphylaxis',
      'snomedcode': '39579001',
      'severitysnomedcode': '371923003',
      'severity': 'mild to moderate'

    }
  end

  subject { AthenaHealth::Reaction.new(reaction_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      reactionname: 'anaphylaxis',
      snomedcode: 39579001,
      severitysnomedcode: 371923003,
      severity: 'mild to moderate'
    )
  end
end
