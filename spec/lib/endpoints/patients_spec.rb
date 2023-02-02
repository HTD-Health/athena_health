require 'spec_helper'

describe AthenaHealth::Endpoints::Patients do
  describe '#all_patients' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 162
      }
    end

    it 'returns instance of PatientCollection' do
      VCR.use_cassette('all_patients') do
        expect(client.all_patients(**attributes))
          .to be_an_instance_of AthenaHealth::PatientCollection
      end
    end
  end

  describe '#find_patient' do
    let(:attributes) do
      {
        practice_id: 195_900,
        patient_id: 5309
      }
    end

    it 'returns instance of Patient' do
      VCR.use_cassette('find_patient') do
        expect(client.find_patient(**attributes))
          .to be_an_instance_of AthenaHealth::Patient
      end
    end
  end

  describe '#find_bestmatch_patients' do
    let(:attributes) do
      {
        practice_id: 195_900,
        date_of_birth: '01/01/1950',
        first_name: 'Test',
        last_name: 'Patient'
      }
    end

    it 'returns instance of Array' do
      VCR.use_cassette('find_bestmatch_patients') do
        expect(client.find_bestmatch_patients(**attributes))
          .to be_an_instance_of Array
      end
    end
  end

  describe '#create_patient' do
    context 'with correct data' do
      let(:attributes) do
        {
          practice_id: 195_900,
          department_id: 162,
          params: {
            firstname: 'Mateusz',
            lastname: 'U.',
            email: 'mat@u.com',
            dob: '03/30/1992'
          }
        }
      end

      it 'returns patientid of updated Patient' do
        VCR.use_cassette('create_patient') do
          expect(client.create_patient(**attributes))
            .to eq [{ 'patientid' => '5309' }]
        end
      end
    end

    context 'with wrong data' do
      let(:attributes) do
        {
          practice_id: 195_900,
          department_id: 162
        }
      end

      it 'returns Hash of errors' do
        VCR.use_cassette('create_patient_with_wrong_data') do
          expect { client.create_patient(**attributes) }.to raise_error { |error|
            expect(error).to be_a(AthenaHealth::ValidationError)
            expect(error.details).to eq(
              'invalidfields' => [],
              'missingfields' => %w[lastname dob firstname],
              'error' => 'Additional fields are required.'
            )
          }
        end
      end
    end

    context 'with wrong formatted_data' do
      let(:attributes) do
        {
          practice_id: 195_900, department_id: 162,
          params: {
            firstname: 'Mateusz',
            lastname: 'U.',
            email: 'mat@u.com',
            dob: 'wrong date'
          }
        }
      end

      it 'returns Hash with error information' do
        VCR.use_cassette('create_patient_with_wrong_formatted_data') do
          expect { client.create_patient(**attributes) }.to raise_error { |error|
            expect(error).to be_a(AthenaHealth::ValidationError)
            expect(error.details).to eq(
              'error' => 'Improper DOB.'
            )
          }
        end
      end
    end
  end

  describe '#update_patient' do
    let(:attributes) do
      {
        practice_id: 195_900,
        patient_id: 5309,
        params: { lastname: 'Urb.' }
      }
    end

    it 'returns patientid of updated Patient' do
      VCR.use_cassette('update_patient') do
        expect(client.update_patient(**attributes))
          .to eq [{ 'patientid' => '5309' }]
      end
    end
  end

  describe '#create_patient_problem' do
    context 'with correct data' do
      let(:attributes) do
        {
          practice_id: 195_900,
          department_id: 162,
          patient_id: 5309,
          snomed_code: 57_406_009
        }
      end

      it 'returns Hash with success key equal to true' do
        VCR.use_cassette('create_patient_problem') do
          expect(client.create_patient_problem(**attributes))
            .to eq 'success' => 'true'
        end
      end
    end

    context 'with missing data' do
      let(:attributes) do
        {
          practice_id: 195_900,
          department_id: nil,
          patient_id: 5309,
          snomed_code: nil
        }
      end

      it 'returns Hash with error information' do
        VCR.use_cassette('create_patient_problem_with_missing_data') do
          expect { client.create_patient_problem(**attributes) }.to raise_error { |error|
            expect(error).to be_a(AthenaHealth::ValidationError)
            expect(error.details).to eq(
              'detailedmessage' => 'Expecting type integer, but value is ',
              'error' => 'The data provided is invalid.'
            )
          }
        end
      end
    end

    context 'with wrong data' do
      let(:attributes) do
        {
          practice_id: 195_900,
          department_id: 162,
          patient_id: 5309,
          snomed_code: 0
        }
      end

      it 'returns Hash with error information' do
        VCR.use_cassette('create_patient_problem_with_wrong_data') do
          expect(client.create_patient_problem(**attributes))
            .to eq(
              'success' => 'false',
              'errormessage' => "Submitted snomedcode of '0' is not valid."
            )
        end
      end
    end
  end

  describe '#find_patient_problems' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 162,
        patient_id: 5309
      }
    end

    it 'returns instance of PatientProblemCollection' do
      VCR.use_cassette('find_patient_problems') do
        expect(client.find_patient_problems(**attributes))
          .to be_an_instance_of AthenaHealth::PatientProblemCollection
      end
    end
  end

  describe '#patient_encounters' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 162,
        patient_id: 1
      }
    end

    it 'returns instance of EncounterCollection' do
      VCR.use_cassette('patient_encounters') do
        expect(client.patient_encounters(**attributes))
          .to be_an_instance_of AthenaHealth::EncounterCollection
      end
    end
  end

  describe '#patient_lab_results' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 162,
        patient_id: 1
      }
    end

    it 'returns instance of EncounterCollection' do
      VCR.use_cassette('patient_lab_results') do
        expect(client.patient_lab_results(**attributes))
          .to be_an_instance_of AthenaHealth::LabResultCollection
      end
    end
  end

  describe '#patient_lab_result_document' do
    let(:attributes) do
      {
        practice_id: 195_900,
        lab_result_id: 306,
        patient_id: 23
      }
    end

    it 'returns instance of Document' do
      VCR.use_cassette('patient_lab_result_document') do
        expect(client.patient_lab_result_document(**attributes))
          .to be_an_instance_of AthenaHealth::Document
      end
    end
  end

  describe '#patient_medical_history' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 162,
        patient_id: 1
      }
    end

    it 'returns instance of QuestionCollection' do
      VCR.use_cassette('patient_medical_history') do
        expect(client.patient_medical_history(**attributes))
          .to be_an_instance_of AthenaHealth::QuestionCollection
      end
    end
  end

  describe '#update_patient_medical_history' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1,
        questions: [{ questionid: 101, answer: 'N' }]
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('update_patient_medical_history') do
        expect(client.update_patient_medical_history(**parameters))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#patient_prescriptions' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 162,
        patient_id: 1
      }
    end

    it 'returns instance of PrescriptionCollection' do
      VCR.use_cassette('patient_prescriptions') do
        expect(client.patient_prescriptions(**attributes))
          .to be_an_instance_of AthenaHealth::PrescriptionCollection
      end
    end
  end

  describe '#patient_analytes' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 162,
        patient_id: 1
      }
    end

    it 'returns instance of AnalyteCollection' do
      VCR.use_cassette('patient_analytes') do
        expect(client.patient_analytes(**attributes))
          .to be_an_instance_of AthenaHealth::AnalyteCollection
      end
    end
  end

  describe '#patient_appointments' do
    let(:attributes) do
      {
        practice_id: 195_900,
        patient_id: 1
      }
    end

    it 'returns instance of AppointmentCollection' do
      VCR.use_cassette('patient_appointments') do
        expect(client.patient_appointments(**attributes))
          .to be_an_instance_of AthenaHealth::AppointmentCollection
      end
    end
  end

  describe '#patient_documents' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1
      }
    end

    it 'returns instance of DocumentCollection' do
      VCR.use_cassette('patient_documents') do
        expect(client.patient_documents(**attributes))
          .to be_an_instance_of AthenaHealth::DocumentCollection
      end
    end
  end

  describe '#create_patient_document' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1,
        params: {
          documentsubclass: 'ADMIN_BILLING',
          attachmentcontents: 'file.pdf'
        }
      }
    end

    it 'returns documentid' do
      VCR.use_cassette('create_patient_document') do
        expect(client.create_patient_document(**attributes))
          .to eq 'documentid' => '117707'
      end
    end
  end

  describe '#patient_default_pharmacy' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1
      }
    end

    it 'returns instance of Pharmacy' do
      VCR.use_cassette('patient_default_pharmacy') do
        expect(client.patient_default_pharmacy(**attributes))
          .to be_an_instance_of AthenaHealth::Pharmacy
      end
    end
  end

  describe '#set_patient_default_pharmacy' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1,
        params: {
          clinicalproviderid: 11_242_674
        }
      }
    end

    it 'returns succes => true' do
      VCR.use_cassette('set_patient_default_pharmacy') do
        expect(client.set_patient_default_pharmacy(**attributes))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#patient_preferred_pharmacies' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1
      }
    end

    it 'returns instance of PharmacyCollection' do
      VCR.use_cassette('patient_prefferred_pharmacies') do
        expect(client.patient_preferred_pharmacies(**attributes))
          .to be_an_instance_of AthenaHealth::PharmacyCollection
      end
    end
  end

  describe '#add_patient_preferred_pharmacy' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1,
        params: {
          clinicalproviderid: 11_242_674
        }
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('add_patient_prefferred_pharmacy') do
        expect(client.add_patient_preferred_pharmacy(**attributes))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#patient_default_laboratory' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1
      }
    end

    it 'returns instance of Laboratory' do
      VCR.use_cassette('patient_default_laboratory') do
        expect(client.patient_default_laboratory(**attributes))
          .to be_an_instance_of AthenaHealth::Laboratory
      end
    end
  end

  describe '#set_patient_default_laboratory' do
    let(:attributes) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1,
        params: {
          clinicalproviderid: 11_242_674
        }
      }
    end

    it 'returns succes => true' do
      VCR.use_cassette('set_patient_default_laboratory') do
        expect(client.set_patient_default_laboratory(**attributes))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#patient_social_history_templates' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1
      }
    end

    it 'returns array of Template instances' do
      VCR.use_cassette('patient_social_history_templates') do
        templates = client.patient_social_history_templates(**parameters)
        expect(templates.map(&:class).uniq).to eq [AthenaHealth::Template]
      end
    end
  end

  describe '#set_patient_social_history_templates' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1,
        template_ids: [2, 78]
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('set_patient_social_history_templates') do
        expect(client.set_patient_social_history_templates(**parameters))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#update_patient_social_history' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1,
        questions: [{ key: 'SEXUALACTIVITY', answer: 'N' }]
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('update_patient_social_history') do
        expect(client.update_patient_social_history(**parameters))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#patient_social_history' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1
      }
    end

    it 'returns instance of SocialHistory' do
      VCR.use_cassette('patient_social_history') do
        expect(client.patient_social_history(**parameters))
          .to be_an_instance_of AthenaHealth::SocialHistory
      end
    end
  end

  describe '#patient_medications' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1
      }
    end

    it 'returns instance of UserMedicationCollection' do
      VCR.use_cassette('patient_medications') do
        expect(client.patient_medications(**parameters))
          .to be_an_instance_of AthenaHealth::UserMedicationCollection
      end
    end
  end

  describe '#add_patient_medication' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1,
        medication_id: 362_851
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('add_patient_medication') do
        expect(client.add_patient_medication(**parameters))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#update_patient_medications' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1,
        params: {
          nomedicationsreported: false
        }
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('update_patient_medications') do
        expect(client.update_patient_medications(**parameters))
          .to eq 'success' => 'true'
      end
    end

    context 'with empty params' do
      it 'returns success => true' do
        parameters.merge!({ params: {} })

        VCR.use_cassette('update_patient_medications_with_empty_params') do
          expect(client.update_patient_medications(**parameters))
            .to eq 'success' => 'true'
        end
      end
    end

    context 'with nomedicationsreported as nil' do
      it 'returns success => true' do
        parameters.merge!({ params: { nomedicationsreported: nil } })

        VCR.use_cassette('update_patient_medications_with_nil_params') do
          expect(client.update_patient_medications(**parameters))
            .to eq 'success' => 'true'
        end
      end
    end
  end

  describe '#patient_allergies' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1
      }
    end

    it 'returns instance of UserAllergyCollection' do
      VCR.use_cassette('patient_allergies') do
        expect(client.patient_allergies(**parameters))
          .to be_an_instance_of AthenaHealth::UserAllergyCollection
      end
    end
  end

  describe '#update_patient_allergies' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1,
        allergies: [{ allergenid: 24_640, allergenname: 'Aspercreme with Aloe' }]
      }
    end

    context 'without any allergies' do
      it 'returns success => true' do
        parameters.merge!({ allergies: [] })

        VCR.use_cassette('update_patient_allergies_with_allergies_empty_parameter') do
          expect(client.update_patient_allergies(**parameters))
            .to eq 'success' => 'true'
        end
      end
    end

    context 'without any allergies and with nkda' do
      it 'returns success => true' do
        parameters.merge!({ allergies: [], params: { nkda: true } })

        VCR.use_cassette('update_patient_allergies_without_allergies_and_with_nkda') do
          expect(client.update_patient_allergies(**parameters))
            .to eq 'success' => 'true'
        end
      end
    end

    context 'without any allergies and with nkda set to false' do
      it 'returns success => true' do
        parameters.merge!({ allergies: [], params: { nkda: false } })

        VCR.use_cassette('update_patient_allergies_without_allergies_and_with_nkda_false') do
          expect(client.update_patient_allergies(**parameters))
            .to eq 'success' => 'true'
        end
      end
    end

    context 'with empty allergies and empty parameters' do
      it 'returns success => true' do
        parameters.merge!(allergies: [], params: {})

        VCR.use_cassette('update_patient_allergies_with_empty_allergies_and_parameters') do
          expect(client.update_patient_allergies(**parameters))
            .to eq 'success' => 'true'
        end
      end
    end

    context 'with extra parameters' do
      it 'returns success => true' do
        parameters.merge!({ params: { nkda: true } })
        VCR.use_cassette('update_patient_allergies_with_extra_parameters') do
          expect(client.update_patient_allergies(**parameters))
            .to eq 'success' => 'true'
        end
      end
    end

    it 'returns success => true' do
      VCR.use_cassette('update_patient_allergies') do
        expect(client.update_patient_allergies(**parameters))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#verify_patient_privacy_information' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('verify_patient_privacy_information') do
        expect(client.verify_patient_privacy_information(**parameters))
          .to eq [{ 'success' => 'true', 'patientid' => '1' }]
      end
    end
  end

  describe '#create_patient_insurance' do
    let(:parameters) do
      {
        practice_id: 195_900,
        patient_id: 1,
        insurance_package_id: 0,
        sequence_number: 1
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('create_patient_insurance') do
        expect(client.create_patient_insurance(**parameters))
          .to be_an_instance_of AthenaHealth::Insurance
      end
    end
  end

  describe '#update_patient_insurance' do
    let(:parameters) do
      {
        practice_id: 195_900,
        patient_id: 1,
        sequence_number: 1
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('update_patient_insurance') do
        expect(client.update_patient_insurance(**parameters))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#delete_patient_insurance' do
    let(:parameters) do
      {
        practice_id: 195_900,
        patient_id: 1,
        sequence_number: 1
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('delete_patient_insurance') do
        expect(client.delete_patient_insurance(**parameters))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#record_payment' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        patient_id: 1,
        amount: 100,
        payment_method: 'CASH'

      }
    end

    it 'returns success => true' do
      VCR.use_cassette('record_payment') do
        expect(client.record_payment(**parameters))
          .to eq [{ 'success' => 'true', 'paymentbatchid' => '5' }]
      end
    end
  end

  describe '#patient_insurances' do
    let(:parameters) do
      {
        practice_id: 195_900,
        patient_id: 51
      }
    end

    it 'returns instance of InsuranceCollection' do
      VCR.use_cassette('patient_insurances') do
        expect(client.patient_insurances(**parameters))
          .to be_an_instance_of AthenaHealth::InsuranceCollection
      end
    end
  end

  describe '#update_patient_insurance_card_image' do
    let(:parameters) do
      {
        practice_id: 195_900,
        patient_id: 1,
        insurance_id: 21_084,
        image: 'iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg=='
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('update_patient_insurance_card_image') do
        expect(client.update_patient_insurance_card_image(**parameters))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#update_patient_photo' do
    let(:parameters) do
      {
        practice_id: 195_900,
        patient_id: 1,
        image: 'iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg=='
      }
    end

    it 'returns success => true' do
      VCR.use_cassette('update_patient_photo') do
        expect(client.update_patient_photo(**parameters))
          .to eq 'success' => 'true'
      end
    end
  end

  describe '#create_patient_case' do
    context 'with correct data' do
      let(:attributes) do
        {
          practice_id: 195_900,
          patient_id: 2,
          params: {
            documentsource: 'PATIENT',
            documentsubclass: 'PATIENTCASE',
            outboundonly: true,
            providerid: 71,
            departmentid: 1
          }
        }
      end

      it 'returns Hash with patientcaseid and success => true' do
        VCR.use_cassette('create_patient_case') do
          response = client.create_patient_case(**attributes)
          expect(response['success']).to eq true
          expect(response.key?('patientcaseid')).to eq true
        end
      end
    end

    context 'with wrong documentsource or documentsubclass' do
      let(:attributes) do
        {
          practice_id: 195_900,
          patient_id: 2,
          params: {
            documentsource: 'patient',
            documentsubclass: 'PATIENTCASE',
            outboundonly: true,
            providerid: 71,
            departmentid: 1
          }
        }
      end

      it 'returns Hash with error information' do
        VCR.use_cassette('create_patient_case_wrong_source') do
          expect { client.create_patient_case(**attributes) }.to raise_error { |error|
            expect(error).to be_a(AthenaHealth::ValidationError)
            expect(error.details).to eq(
              'detailedmessage' => "The value 'patient' did not match any of the enum values for SOURCE",
              'error' => 'The data provided is invalid.'
            )
          }
        end
      end
    end
  end

  describe '#create_patient_encounter_document' do
    let(:attributes) do
      {
        practice_id: 19_598_472,
        department_id: 150,
        patient_id: 5840,
        document_subclass: 'PATIENTHISTORY',
        attachment_contents: File.open('spec/fixtures/sample_doc.pdf', 'rb'),
        encounter_id: 42_917,
        params: {
          internalnote: 'test note'
        }
      }
    end

    it 'returns documentid' do
      VCR.use_cassette('create_patient_encounter_document') do
        expect(client.create_patient_encounter_document(**attributes))
          .to eq 205_959
      end
    end
  end
end
