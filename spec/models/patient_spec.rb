require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'methods' do
    it '#adults' do
      hospital = Hospital.create!(name: 'Philadephia General')
      doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
      doctor2 = hospital.doctors.create!(name: 'Philly Phanatic', specialty: 'Substance Abuse', university: 'School of the Hard Knocks')
      
      patient1 = doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
      patient2 = doctor.patients.create!(name: 'Dee Reynolds', age: 32)
      patient3 = doctor.patients.create!(name: 'Charlie Kelly', age: 31 )
      patient4 = doctor2.patients.create!(name: 'Rickety Cricket', age: 37)
      patient5 = doctor2.patients.create!(name: 'Dumpster Baby', age: 1 )

      expect(Patient.adults).to eq([patient3, patient2, patient1, patient4])
    end
  end
end
