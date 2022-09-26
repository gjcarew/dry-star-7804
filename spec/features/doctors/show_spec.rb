require 'rails_helper'

RSpec.describe 'When I visit a doctor show page' do
  describe 'User story 1' do
    it 'I see the doctor name, specialty, and university' do
      hospital = Hospital.create!(name: 'Philadephia General')
      doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
      visit doctor_path(doctor)
      expect(page).to have_content(doctor.name)
      expect(page).to have_content(doctor.specialty)
      expect(page).to have_content(doctor.university)
    end

    it 'I see the name of the hospital they work at' do
      hospital = Hospital.create!(name: 'Philadephia General')
      doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
      visit doctor_path(doctor)
      expect(page).to have_content(hospital.name)
    end

    it 'I see the names of all the patients the doctor has' do
      hospital = Hospital.create!(name: 'Philadephia General')
      doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
      patient1 = doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
      patient2 = doctor.patients.create!(name: 'Dee Reynolds', age: 32)
      patient3 = doctor.patients.create!(name: 'Charlie Kelly', age: 31 )

      visit doctor_path(doctor)
      expect(page).to have_content(patient1.name)
      expect(page).to have_content(patient2.name)
      expect(page).to have_content(patient3.name)
    end
  end

  describe 'User story 2' do
    it 'Next to each patient name is a button to remove the patient from the doctor' do
      hospital = Hospital.create!(name: 'Philadephia General')
      doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
      patient1 = doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
      patient2 = doctor.patients.create!(name: 'Dee Reynolds', age: 32)
      patient3 = doctor.patients.create!(name: 'Charlie Kelly', age: 31 )

      visit doctor_path(doctor)
      within "#patient-#{patient1.id}" do
        expect(page).to have_content('Remove patient from caseload')
      end
      within "#patient-#{patient2.id}" do
        expect(page).to have_content('Remove patient from caseload')
      end
      within "#patient-#{patient2.id}" do
        expect(page).to have_content('Remove patient from caseload')
      end
    end

    it 'When I click that button, I am returned to the doctor show page where the patient
     is no longer listed' do
      hospital = Hospital.create!(name: 'Philadephia General')
      doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
      patient1 = doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
      patient2 = doctor.patients.create!(name: 'Dee Reynolds', age: 32)
      patient3 = doctor.patients.create!(name: 'Charlie Kelly', age: 31 )

      visit doctor_path(doctor)
      within "#patient-#{patient1.id}" do
        click_button 'Remove patient from caseload'
      end

      expect(current_path).to eq(doctor_path(doctor))
      expect(page).not_to have_content(patient1.name)
      expect(page).to have_content(patient2.name)
      expect(page).to have_content(patient3.name)
    end
  end
end
