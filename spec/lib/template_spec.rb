require 'spec_helper'

describe AthenaHealth::Template do
  let(:template_attributes) do
    {
      'templatename': 'Urology',
      'templateid': '78'
    }
  end

  subject { AthenaHealth::Template.new(template_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      templatename: 'Urology',
      templateid: 78
    )
  end
end
