class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_patient_count
    Doctor.joins(:patients)
          .select('doctors.*, count(doctor_patients.id) as patient_count')
          .where("doctors.hospital_id = #{id}")
          .group('doctors.id')
          .order(patient_count: :desc)
  end
end
