require 'rails_helper'

RSpec.describe 'When I visit the patient index page' do
  it 'I see the names of all adult patients (age > 18)' do
    hospital = Hospital.create!(name: 'Philadephia General')
    doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
    doctor2 = hospital.doctors.create!(name: 'Philly Phanatic', specialty: 'Substance Abuse', university: 'School of the Hard Knocks')
    
    patient1 = doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
    patient2 = doctor.patients.create!(name: 'Dee Reynolds', age: 32)
    patient3 = doctor.patients.create!(name: 'Charlie Kelly', age: 31 )
    patient4 = doctor2.patients.create!(name: 'Rickety Cricket', age: 37)
    patient5 = doctor2.patients.create!(name: 'Dumpster Baby', age: 1 )

    expect(page).to have_content(patient1.name)
    expect(page).to have_content(patient2.name)
    expect(page).to have_content(patient3.name)
    expect(page).to have_content(patient4.name)
    expect(page).not_to have_content(patient5.name)
      
  end

  it 'The names are in ascending alphabetical order' do
    hospital = Hospital.create!(name: 'Philadephia General')
    doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
    doctor2 = hospital.doctors.create!(name: 'Philly Phanatic', specialty: 'Substance Abuse', university: 'School of the Hard Knocks')
    
    patient1 = doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
    patient2 = doctor.patients.create!(name: 'Dee Reynolds', age: 32)
    patient3 = doctor.patients.create!(name: 'Charlie Kelly', age: 31 )
    patient4 = doctor2.patients.create!(name: 'Rickety Cricket', age: 37)

    expect(all(".patient-name")[0].text).to have_content(patient3.name)
    expect(all(".patient-name")[1].text).to have_content(patient2.name)
    expect(all(".patient-name")[2].text).to have_content(patient1.name)
    expect(all(".patient-name")[3].text).to have_content(patient4.name)
  end
end