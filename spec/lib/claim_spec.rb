# frozen_string_literal: true

require 'spec_helper'

describe AthenaHealth::Claim::Claim do
  subject { AthenaHealth::Claim::Claim.new(**attributes) }

  let(:attributes) do
    { 'procedures' => [{ 'chargeamount' => '225', 'proceduredescription' => 'INITIAL OFFICE VISIT LIMITED', 'transactionid' => '2801', 'procedurecode' => '99202' }],
      'claimcreateddate' => '06/22/2016',
      'transactiondetails' => { '2801' => '225' },
      'patientpayer' => { 'status' => 'CLOSED' },
      'billedproviderid' => 27,
      'claimid' => '301',
      'primaryinsurancepayer' => { 'primarypatientinsuranceid' => 1442, 'status' => 'CLOSED' },
      'billedservicedate' => '06/22/2016',
      'departmentid' => 1,
      'diagnoses' =>
 [{ 'diagnosiscategory' => 'SYMPTOMS AND SIGNS INVOLVING THE DIGESTIVE SYSTEM AND ABDOMEN (R10-R19)',
    'diagnosisid' => '728',
    'diagnosisrawcode' => 'R10.13',
    'diagnosiscodeset' => 'ICD10',
    'diagnosisdescription' => 'Epigastric pain',
    'deleteddiagnosis' => 'false' }],
      'patientid' => 1,
      'secondaryinsurancepayer' =>
 { 'secondarypatientinsuranceid' => 1562, 'status' => 'CLOSED', 'note' => 'The Current illness date has been set to 06/22/2016 based on the earliest charge on the claim.' } }
  end

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      claimid: 301,
    )
    expect(subject.secondaryinsurancepayer).to have_attributes(
      patientinsuranceid: 1562,
      status: 'CLOSED'
    )
    expect(subject.primaryinsurancepayer).to have_attributes(
      patientinsuranceid: 1442,
      status: 'CLOSED'
    )
    expect(subject.patientpayer).to have_attributes(
      patientinsuranceid: nil,
      status: 'CLOSED'
    )
    expect(subject.diagnoses.first).to have_attributes(
      diagnosisid: 728,
    )
    expect(subject.procedures.first).to have_attributes(
      procedurecode: '99202',
    )
    expect(subject.transactiondetails['2801']).to eq(
      '225'
    )
  end
end
