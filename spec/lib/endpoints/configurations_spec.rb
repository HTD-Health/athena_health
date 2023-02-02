require 'spec_helper'

describe AthenaHealth::Endpoints::Configurations do
  describe '#all_facilities' do
    let(:parameters) do
      {
        practice_id: 195_900,
        department_id: 1,
        order_type: 'PRESCRIPTION',
        params: {
          name: 'New York'
        }
      }
    end

    it 'returns array of Facility instances' do
      VCR.use_cassette('all_facilities') do
        facilities = client.all_facilities(**parameters)
        expect(facilities.map(&:class).uniq).to eq [AthenaHealth::Facility]
      end
    end
  end

  describe '#all_medications' do
    let(:parameters) do
      {
        practice_id: 195_900,
        search_value: 'asp'
      }
    end

    it 'returns array of Medication instances' do
      VCR.use_cassette('all_medications') do
        medications = client.all_medications(**parameters)
        expect(medications.map(&:class).uniq).to eq [AthenaHealth::Medication]
      end
    end
  end

  describe '#all_allergies' do
    let(:parameters) do
      {
        practice_id: 195_900,
        search_value: 'asp'
      }
    end

    it 'returns array of Allergy instances' do
      VCR.use_cassette('all_allergies') do
        allergies = client.all_allergies(**parameters)
        expect(allergies.map(&:class).uniq).to eq [AthenaHealth::Allergy]
      end
    end
  end

  describe '#all_insurances' do
    let(:parameters) do
      {
        practice_id: 195_900,
        plan_name: 'Wal',
        member_id: 'asd',
        state: 'NY'
      }
    end

    it 'returns instance of InsuranceCollection' do
      VCR.use_cassette('all_insurances') do
        expect(client.all_insurances(**parameters))
          .to be_an_instance_of AthenaHealth::InsuranceCollection
      end
    end
  end

  describe '#all_order_types' do
    let(:parameters) do
      {
        practice_id: 195_900,
        search_value: 'HIV'
      }
    end

    it 'returns array of Allergy instances' do
      VCR.use_cassette('all_order_types') do
        order_types = client.all_order_types(**parameters)
        expect(order_types.map(&:class).uniq).to eq [AthenaHealth::OrderType]
      end
    end
  end

  describe '#available_screening_questionaires' do
    let(:parameters) do
      {
        practice_id: 195_900
      }
    end

    it 'returns a collection of the available questionaires' do
      VCR.use_cassette('available_screening_questionaires') do
        questionaires = client.available_screening_questionaires(**parameters)

        expect(questionaires.totalcount).to eq 352

        phq9 = questionaires.questionnairescreeners.first
        expect(phq9.name).to eq('PHQ-2/PHQ-9')
        expect(phq9.templatetype).to eq('CUSTOM')
        expect(phq9.templateid).to eq(1)
      end
    end
  end

  describe '#all_gender_identities' do
    let(:base_params) do
      {
        practice_id: 195_900
      }
    end

    let(:extra_params) do
      {}
    end

    let(:parameters) do
      base_params.merge(extra_params)
    end

    it 'returns array of Allergy instances' do
      VCR.use_cassette('all_gender_identities') do
        gender_identities = client.all_gender_identities(**parameters)
        expect(gender_identities.totalcount).to eq 6
        expect(gender_identities.genderidentityfields)
          .to match_array(
            ['', 'Additional gender category or other',
             'Choose not to disclose', 'Female',
             'Genderqueer (neither exclusively male nor female)', 'Male']
          )
      end
    end
    context 'with show2015edcehrtvalues set to true' do
      let(:extra_params) do
        {
          show2015edcehrtvalues: true
        }
      end
      it 'returns array of Allergy instances' do
        VCR.use_cassette('all_gender_identities') do
          gender_identities = client.all_gender_identities(**parameters)
          expect(gender_identities.genderidentityfields)
            .to match_array(
              ['', 'Additional gender category / other, please specify',
               'Choose not to disclose', 'Gender non-conforming (neither exclusively male nor female)',
               'Identifies as Female', 'Identifies as Male',
               'Transgender Female/Male-to-Female (MTF)', 'Transgender Male/Female-to-Male (FTM)']
            )
        end
      end
    end
  end
end
