# frozen_string_literal: true

require 'spec_helper'

describe AthenaHealth::CustomField do
  subject { AthenaHealth::CustomField.new(**attributes) }

  let(:attributes) do
    { "selectlist": [{ "optionvalue": 'Yes', "optionid": '61' }, { "optionvalue": 'No', "optionid": '62' }], "customfieldid": '162', "disallowupdate": false, "select": true, "casesensitive": false, "name": 'Healthkit Enabled', "type": 'TEXT' }
  end

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      type: 'TEXT',
      name: 'Healthkit Enabled'
    )
  end
end
