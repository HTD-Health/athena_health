# frozen_string_literal: true

require 'spec_helper'

describe AthenaHealth::Endpoints::CustomFields do
  describe '#all_custom_fields' do
    let(:practice_id) { 195_900 }

    it 'returns and array of CustomField' do
      VCR.use_cassette('custom_fields') do
        fields = client.all_custom_fields(practice_id: practice_id)
        expect(fields)
          .to be_an_instance_of Array
        fields.each do |field|
          expect(field)
            .to be_an_instance_of AthenaHealth::CustomField
        end
      end
    end
  end
end
