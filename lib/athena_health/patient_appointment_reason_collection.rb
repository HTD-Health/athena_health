module AthenaHealth
  class PatientAppointmentReasonCollection < BaseCollection
    attribute :patientappointmentreasons, Array[PatientAppointmentReason]

     alias_method :patient_appointment_reasons, :patientappointmentreasons
  end
end
