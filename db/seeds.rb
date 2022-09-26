hospital = Hospital.create!(name: 'Philadephia General')

doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
doctor2 = hospital.doctors.create!(name: 'Philly Phanatic', specialty: 'Substance Abuse', university: 'School of the Hard Knocks')

patient1 = doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
patient2 = doctor.patients.create!(name: 'Dee Reynolds', age: 32)
patient3 = doctor.patients.create!(name: 'Charlie Kelly', age: 31 )
patient4 = doctor2.patients.create!(name: 'Rickety Cricket', age: 37)
patient5 = doctor2.patients.create!(name: 'Dumpster Baby', age: 1 )
