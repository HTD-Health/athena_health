require 'spec_helper'

describe AthenaHealth::Insurance do
  let(:insurance_attributes) do
    {
      'affiliations': ['ACP Mercy', 'HealthSCOPE Benefits', 'Walmart'],
      'insurancepackageid': '352029',
      'addresslist': ['PO BOX 16367  LUBBOCK TX 79490-6367'],
      'insurancepolicyholdercountrycode': 'USA',
      'sequencenumber': 1,
      'insuranceplanname': 'Test insurance',
      'insurancetype': 'Commercial',
      'insurancepolicyholderlastname': 'Test',
      'insurancephone': '123-123-123',
      'insuranceidnumber': '123',
      'relationshiptoinsuredid': '1',
      'insuranceid': '1',
      'insurancepolicyholder': 'Test 123',
      'insurancepolicyholderdob': '06/07/1993',
      'eligibilitylastchecked': '06/15/2016',
      'relationshiptoinsured': 'Self',
      'eligibilitystatus': 'Eligible',
      'insurancepolicyholderfirstname': 'Mateusz',
      'insurancepolicyholdersex': 'M',
      'eligibilityreason': 'Athena',
      'insurancepolicyholdercountryiso3166': 'US',
      'eligibilitymessage': 'Test',
      'ircname': 'National Benefit Fund'
    }
  end

  subject { AthenaHealth::Insurance.new(insurance_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      affiliations: ['ACP Mercy', 'HealthSCOPE Benefits', 'Walmart'],
      insurancepackageid: 352029,
      addresslist: ['PO BOX 16367  LUBBOCK TX 79490-6367'],
      insurancepolicyholdercountrycode: 'USA',
      sequencenumber: 1,
      insuranceplanname: 'Test insurance',
      insurancetype: 'Commercial',
      insurancepolicyholderlastname: 'Test',
      insurancephone: '123-123-123',
      insuranceidnumber: '123',
      relationshiptoinsuredid: 1,
      insuranceid: 1,
      insurancepolicyholder: 'Test 123',
      insurancepolicyholderdob: '06/07/1993',
      eligibilitylastchecked: '06/15/2016',
      relationshiptoinsured: 'Self',
      eligibilitystatus: 'Eligible',
      insurancepolicyholderfirstname: 'Mateusz',
      insurancepolicyholdersex: 'M',
      eligibilityreason: 'Athena',
      insurancepolicyholdercountryiso3166: 'US',
      eligibilitymessage: 'Test',
      ircname: 'National Benefit Fund'
    )
  end
end
