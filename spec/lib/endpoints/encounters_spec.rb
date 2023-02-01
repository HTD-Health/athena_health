require 'spec_helper'

describe AthenaHealth::Endpoints::Encounters do
  describe '#find_encounter' do
    let(:attributes) do
      {
        practice_id: 195_900,
        encounter_id: 28_302
      }
    end

    it 'returns instance of Encounter' do
      VCR.use_cassette('find_encounter') do
        expect(client.find_encounter(**attributes))
          .to be_an_instance_of AthenaHealth::Encounter
      end
    end
  end

  describe '#encounter_orders' do
    let(:attributes) do
      {
        practice_id: 195_900,
        encounter_id: 28_302
      }
    end

    it 'returns instance of Encounter' do
      VCR.use_cassette('encounter_orders') do
        expect(client.encounter_orders(**attributes).first)
          .to be_an_instance_of AthenaHealth::OrderCollection
      end
    end
  end

  describe '#encounter_order' do
    let(:attributes) do
      {
        practice_id: 195_900,
        encounter_id: 28_302,
        order_id: 116_881
      }
    end

    it 'returns instance of Encounter' do
      VCR.use_cassette('encounter_order') do
        expect(client.encounter_order(**attributes))
          .to be_an_instance_of AthenaHealth::Order
      end
    end
  end

  describe '#encouter_summary' do
    let(:attributes) do
      {
        practice_id: 195_900,
        encounter_id: 28_302
      }
    end

    it 'returns instance of EncounterSummary' do
      VCR.use_cassette('encounter_summary') do
        expect(client.encounter_summary(**attributes))
          .to be_an_instance_of AthenaHealth::EncounterSummary
      end
    end
  end

  describe '#create_encounter_order_lab' do
    context 'with correct data' do
      let(:attributes) do
        {
          practice_id: 195_900,
          encounter_id: 35_713,
          body: {
            diagnosissnomedcode: 284_196_006,
            ordertypeid: 387_225
          }
        }
      end

      it 'returns a newly created documentid' do
        VCR.use_cassette('create_encounter_order_lab') do
          expect(client.create_encounter_order_lab(**attributes))
            .to be_an_instance_of Hash
        end
      end
    end

    context 'with no order_type_id' do
      let(:attributes) do
        {
          practice_id: 195_900,
          encounter_id: 35_713,
          body: {
            diagnosissnomedcode: 284_196_006
          }
        }
      end

      it 'raise AthenaHealth::ValidationError error' do
        VCR.use_cassette('create_encounter_order_lab_no_order_type_id') do
          expect { client.create_encounter_order_lab(**attributes) }.to raise_error { |error|
            expect(error.details).to eq(
              'detailedmessage' => 'You must specify which lab to order, either via the ordertypeid or a LOINC.',
              'error' => 'The data provided is invalid.'
            )
          }
        end
      end
    end

    context 'with no diagnosis_snomed_code' do
      let(:attributes) do
        {
          practice_id: 195_900,
          encounter_id: 35_713,
          body: {
            ordertypeid: 387_225
          }
        }
      end

      it 'raise AthenaHealth::ValidationError error' do
        VCR.use_cassette('create_encounter_order_lab_no_diagnosis_snomed_code') do
          expect { client.create_encounter_order_lab(**attributes) }.to raise_error { |error|
            expect(error.details).to eq(
              'detailedmessage' => 'The diagnosis was not found. Please specify an existing diagnosis or add it to the encounter first.',
              'error' => 'The data provided is invalid.'
            )
          }
        end
      end
    end
  end

  describe '#create_order_group' do
    let(:attributes) do
      {
        practice_id: 195_900,
        patient_id: 2,
        body: {
          patientcaseid: 173_696,
          departmentid: 1
        }
      }
    end

    it 'returns Hash with encounterid and success => true' do
      VCR.use_cassette('create_order_group') do
        response = client.create_order_group(**attributes)
        expect(response['success']).to eq true
        expect(response.key?('encounterid')).to eq true
      end
    end
  end

  describe '#create_encounter_diagnoses' do
    context 'with correct data' do
      let(:attributes) do
        {
          practice_id: 195_900,
          encounter_id: 35_840,
          body: {
            snomedcode: 174_041_007
          }
        }
      end

      it 'returns Hash with success => true' do
        VCR.use_cassette('create_encounter_diagnoses') do
          expect(client.create_encounter_diagnoses(**attributes))
            .to include('success' => true)
        end
      end
    end

    context 'with wrong snomedcode' do
      let(:attributes) do
        {
          practice_id: 195_900,
          encounter_id: 35_840,
          body: {
            snomedcode: 77_777_777_777
          }
        }
      end

      it 'returns Hash with error information' do
        VCR.use_cassette('create_encounter_diagnoses_wrong_snomed_code') do
          expect { client.create_encounter_diagnoses(**attributes) }.to raise_error { |error|
            expect(error).to be_a(AthenaHealth::ValidationError)
            expect(error.details).to eq(
              'detailedmessage' => 'SNOMED code not valid.',
              'error' => 'The data provided is invalid.'
            )
          }
        end
      end
    end
  end

  describe '#encounter_screening_questionnaires' do
    before(:each) do
      VCR.insert_cassette('encounter_screening_questionnaires')
    end
    after(:each) do
      VCR.eject_cassette
    end
    # VCR.use_cassette('encounter_screening_questionnaires')
    let(:attributes) do
      {
        practice_id: 19_598_472,
        encounter_id: 42_917
      }
    end

    let(:result) do
      client.encounter_screening_questionnaires(**attributes)
    end

    it 'returns a ScreeningQuestionaireCollection' do
      expect(result)
        .to be_an_instance_of AthenaHealth::ScreeningQuestionaire::ScreeningQuestionaireCollection
    end

    it 'has 3 screeners' do
      expect(result.questionnairescreeners.count)
        .to eq 4
    end

    4.times do |i|
      it "#{i} returns a ScreeningQuestionaireCollection" do
        expect(result.questionnairescreeners[i])
          .to be_an_instance_of AthenaHealth::ScreeningQuestionaire::ScreeningQuestionaire
      end
    end
  end
end
