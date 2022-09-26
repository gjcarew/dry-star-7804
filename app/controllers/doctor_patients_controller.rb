class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    doctor_patient = doctor.doctor_patients.where(patient_id: params[:id])
    doctor_patient[0].destroy
    redirect_to doctor_path(doctor)
  end
end
