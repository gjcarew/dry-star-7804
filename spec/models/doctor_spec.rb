require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to :hospital }
    it { should have_many :doctor_patients }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe 'methods' do
    it '#hospital_name' do
      hospital = Hospital.create!(name: 'Philadephia General')
      doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
      expect(doctor.hospital_name).to eq(hospital.name)
    end
  end
end