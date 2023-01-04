require 'spec_helper'

describe AthenaHealth::Appointment do
  let(:appointment_attributes) do
    {
      'appointmentconfirmationname': 'Confirmed',
      'appointmentid': '663560',
      'encounterid': '33',
      'appointmentstatus': 'f',
      'appointmenttype': 'Any 15',
      'appointmenttypeid': '82',
      'cancelleddatetime': '04\/03\/2016 18:00:00',
      'cancelreasonname': 'CANCELLED FROM API',
      'cancelreasonnoshow': false,
      'coordinatorenterprise': true,
      'date': '02/23/2016',
      'departmentid': '1',
      'duration': 30,
      'frozen': false,
      'lastmodified': '04\/02\/2016 20:00:54',
      'patient': nil,
      'patientappointmenttypename': 'Established Patient',
      'patientid': '1',
      'providerid': '71',
      'rescheduledappointmentid': '1',
      'scheduledby': 'API-2553',
      'scheduleddatetime': '04\/02\/2016 20:00:54',
      'starttime': '12:15',
      'templateappointmentid': '4',
    }
  end

  subject { AthenaHealth::Appointment.new(appointment_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      appointmentconfirmationname: 'Confirmed',
      appointmentid: 663560,
      encounterid: 33,
      appointmentstatus: 'f',
      appointmenttype: 'Any 15',
      appointmenttypeid: 82,
      cancelleddatetime: '04\/03\/2016 18:00:00',
      cancelreasonname: 'CANCELLED FROM API',
      cancelreasonnoshow: false,
      coordinatorenterprise: true,
      date: '02/23/2016',
      departmentid: 1,
      duration: 30,
      frozen: false,
      lastmodified: '04\/02\/2016 20:00:54',
      patient: nil,
      patientappointmenttypename: 'Established Patient',
      patientid: 1,
      providerid: 71,
      rescheduledappointmentid: 1,
      scheduledby: 'API-2553',
      scheduleddatetime: '04\/02\/2016 20:00:54',
      starttime: '12:15',
      templateappointmentid: 4,
    )
  end

  describe '#appointment_status' do
    before { subject.appointmentstatus = status }

    context 'when appointmentstatus = x' do
      let(:status) { 'x' }

      it 'returns cancelled' do
        expect(subject.appointment_status).to eq 'Cancelled'
      end
    end

    context 'when appointmentstatus = f' do
      let(:status) { 'f' }

      it 'returns future' do
        expect(subject.appointment_status).to eq 'Future'
      end
    end

    context 'when appointmentstatus = o' do
      let(:status) { 'o' }

      it 'returns open' do
        expect(subject.appointment_status).to eq 'Open'
      end
    end

    context 'when appointmentstatus = 2' do
      let(:status) { '2' }

      it 'returns open' do
        expect(subject.appointment_status).to eq 'Checked in'
      end
    end

    context 'when appointmentstatus = 3' do
      let(:status) { '3' }

      it 'returns open' do
        expect(subject.appointment_status).to eq 'Checked out'
      end
    end

    context 'when appointmentstatus = 4' do
      let(:status) { '4' }

      it 'returns open' do
        expect(subject.appointment_status).to eq 'Charge entered'
      end
    end
  end

  describe 'full_time' do
    it 'returns properly formated time' do
      expect(subject.full_time)
        .to eq "#{subject.date} #{subject.starttime}"
    end
  end
end
