require 'spec_helper'

describe AthenaHealth::ProviderCollection do
  let(:provider_collection_attributes) do
    {
      'next': 'next_page_url',
      'previous': 'previous_page_url',
      'providers': [
        {
          'firstname': 'Terry',
          'specialty': 'Internal Medicine',
          'acceptingnewpatients': 'false',
          'providertypeid': 'MD',
          'billable': 'false',
          'displayname': 'Doctor Terry',
          'ansinamecode': 'Family Practice (207Q00000X)',
          'lastname': 'Ahmad',
          'providerid': '86',
          'providerusername': 'terryahmad',
          'ansispecialtycode': '207Q00000X',
          'hideinportal': 'false',
          'entitytype': 'Person',
          'npi': '90635210',
          'providertype': 'MD'
        }
      ],
      'totalcount': 1,
    }
  end

  subject { AthenaHealth::ProviderCollection.new(provider_collection_attributes) }

  it_behaves_like 'a collection'

  it 'have proper attributes' do
    expect(subject.providers.map(&:class)).to eq [AthenaHealth::Provider]
  end
end
