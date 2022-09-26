require 'rails_helper'

RSpec.describe 'When I visit a hospital show page' do
  before :each do 
    @hospital = Hospital.create!(name: 'Philadephia General')
    @other_hospital = Hospital.create!(name: 'greys anatomy hospital')

    @doctor = @hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
    @doctor2 = @hospital.doctors.create!(name: 'Philly Phanatic', specialty: 'Substance Abuse', university: 'School of the Hard Knocks')
    @doctor3 = @other_hospital.doctors.create!(name: 'MacDreamy', specialty: 'Eyes', university: 'Harvard')

    patient1 = @doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
    patient2 = @doctor.patients.create!(name: 'Dee Reynolds', age: 32)
    patient3 = @doctor.patients.create!(name: 'Charlie Kelly', age: 31 )
    patient4 = @doctor2.patients.create!(name: 'Rickety Cricket', age: 37)
    patient5 = @doctor2.patients.create!(name: 'Dumpster Baby', age: 1 )
  end

  xit 'I see the hospital name' do
    visit hospital_path(@hospital)
    expect(page).to have_content(@hospital.name)
  end

  xit 'I see the names of all doctors that work at this hospital' do
    visit hospital_path(@hospital)
    expect(page).to have_content(@doctor.name)
    expect(page).to have_content(@doctor2.name)
    expect(page).not_to have_content(@doctor3.name)
  end

  xit 'Next to each doctor is the number of patients the doctor has' do 
    visit hospital_path(@hospital)

    within "#doctor-#{@doctor.id}" do
      expect(page).to have_content('3 patients')
    end

    within "#doctor-#{@doctor2.id}" do
      expect(page).to have_content('2 patients')
    end
  end

  xit 'The list of doctors is ordered from most patients to least patients' do 
    expect(all(".doctors")[0].text).to eq('Mantis Toboggan: 3 patients')
    expect(all(".doctors")[1].text).to eq('Philly Phanatic: 3 patients')
  end
end