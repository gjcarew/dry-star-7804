require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many :doctors }
  end

  describe 'methods' do
    describe '#doctor_patient_count' do
      it 'returns all doctors that work at a hospital' do
        hospital = Hospital.create!(name: 'Philadephia General')
        doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
        doctor2 = hospital.doctors.create!(name: 'Philly Phanatic', specialty: 'Substance Abuse', university: 'School of the Hard Knocks')
        patient1 = doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
        patient2 = doctor.patients.create!(name: 'Dee Reynolds', age: 32)
        patient3 = doctor.patients.create!(name: 'Charlie Kelly', age: 31 )
        patient4 = doctor2.patients.create!(name: 'Rickety Cricket', age: 37)
        patient5 = doctor2.patients.create!(name: 'Dumpster Baby', age: 1 )
        expect(hospital.doctor_patient_count).to eq([doctor, doctor2])
      end 

      it 'includes the number of patients associated with each doctor' do
        hospital = Hospital.create!(name: 'Philadephia General')
        doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
        doctor2 = hospital.doctors.create!(name: 'Philly Phanatic', specialty: 'Substance Abuse', university: 'School of the Hard Knocks')
        patient1 = doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
        patient2 = doctor.patients.create!(name: 'Dee Reynolds', age: 32)
        patient3 = doctor.patients.create!(name: 'Charlie Kelly', age: 31 )
        patient4 = doctor2.patients.create!(name: 'Rickety Cricket', age: 37)
        patient5 = doctor2.patients.create!(name: 'Dumpster Baby', age: 1 )

        expect(hospital.doctor_patient_count.first.patient_count).to eq(3) 
        expect(hospital.doctor_patient_count.last.patient_count).to eq(2) 
      end

      it 'The list is ordered from most to least patients' do
        hospital = Hospital.create!(name: 'Philadephia General')
        doctor2 = hospital.doctors.create!(name: 'Philly Phanatic', specialty: 'Substance Abuse', university: 'School of the Hard Knocks')
        doctor3 = hospital.doctors.create!(name: 'MacDreamy', specialty: 'Eyes', university: 'Harvard')
        doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
        patient1 = doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
        patient2 = doctor.patients.create!(name: 'Dee Reynolds', age: 32)
        patient3 = doctor.patients.create!(name: 'Charlie Kelly', age: 31 )
        patient4 = doctor2.patients.create!(name: 'Rickety Cricket', age: 37)
        patient5 = doctor2.patients.create!(name: 'Dumpster Baby', age: 1 )

        expect(hospital.doctor_patient_count).to eq([doctor, doctor2, doctor3])
      end
    end
  end
end
