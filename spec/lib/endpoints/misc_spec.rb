require 'spec_helper'

describe AthenaHealth::Endpoints::Misc do
  describe '#patient_locations' do
    let(:attributes) do
      {
        practice_id: 195_900
      }
    end

    it 'returns a hash of available patient locations' do
      VCR.use_cassette('patient_locations') do
        expect(client.patient_locations(attributes)).to \
          eql([{"patientlocationid"=>"2", "name"=>"Office 2"},
               {"patientlocationid"=>"1", "name"=>"Office 1"},
               {"patientlocationid"=>"21", "name"=>"Patient Rm. 1"}])
      end
    end
  end
end
