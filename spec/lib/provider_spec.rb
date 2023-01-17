require 'spec_helper'

describe AthenaHealth::Provider do
  let(:provider_attributes) do
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
      'providertype': 'MD',
      'otherprovideridlist': ['209']
    }
  end

  subject { AthenaHealth::Provider.new(provider_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      firstname: 'Terry',
      specialty: 'Internal Medicine',
      acceptingnewpatients: false,
      providertypeid: 'MD',
      billable: false,
      displayname: 'Doctor Terry',
      ansinamecode: 'Family Practice (207Q00000X)',
      lastname: 'Ahmad',
      providerid: 86,
      providerusername: 'terryahmad',
      ansispecialtycode: '207Q00000X',
      hideinportal: false,
      entitytype: 'Person',
      npi: 90635210,
      providertype: 'MD',
      fullname: 'Terry Ahmad',
      otherprovideridlist: ['209']
    )
  end
end
