hospital = Hospital.create!(name: 'Philadephia General')
doctor = hospital.doctors.create!(name: 'Mantis Toboggan', specialty: 'Toe Surgery', university: 'No')
patient1 = doctor.patients.create!(name: 'Dennis Reynolds', age: 32)
patient2 = doctor.patients.create!(name: 'Dee Reynolds', age: 32)
patient3 = doctor.patients.create!(name: 'Charlie Kelly', age: 31 )
