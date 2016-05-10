require 'spec_helper'

describe AthenaHealth::Appointment do
  let(:appointment_attributes) do
    {
      'date': '02/23/2016',
      'appointmentid': '663560',
      'departmentid': '1',
      'appointmenttype': 'Any 15',
      'appointmentstatus': 'f',
      'patientid': '1',
      'providerid': '71',
      'starttime': '12:15',
      'duration': 30,
      'appointmenttypeid': '82',
      'patientappointmenttypename': 'Established Patient',
      'lastmodified': '04\/02\/2016 20:00:54',
      'scheduleddatetime': '04\/02\/2016 20:00:54',
      'scheduledby': 'API-2553',
      'templateappointmentid': '4'
    }
  end

  subject { AthenaHealth::Appointment.new(appointment_attributes) }

  it_behaves_like 'a model'

  it 'have proper attributes' do
    expect(subject).to have_attributes(
      date: '02/23/2016',
      appointmentid: 663560,
      departmentid: 1,
      appointmenttype: 'Any 15',
      appointmentstatus: 'f',
      patientid: 1,
      providerid: 71,
      starttime: '12:15',
      duration: 30,
      appointmenttypeid: 82,
      patientappointmenttypename: 'Established Patient',
      lastmodified: '04\/02\/2016 20:00:54',
      scheduleddatetime: '04\/02\/2016 20:00:54',
      scheduledby: 'API-2553',
      templateappointmentid: 4
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
        .to eq Time.strptime("#{subject.date} #{subject.starttime}", '%m/%d/%Y %H:%M')
    end
  end
end
