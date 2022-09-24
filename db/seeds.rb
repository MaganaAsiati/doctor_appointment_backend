# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users
user = User.create(name: 'User 1', email: 'user1@gmail.com', password: '123456')
admin = User.create(name: 'admin', email: 'admin@gamil.com', password: '123456', role: 'admin')

# doctors
Christina  = admin.doctors.create(
    name: 'Christina Milian',
    speciality: 'Neurology', 
    image: 'https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?w=2000',    
    reserved: true,
    description: 'some description about this Christina Milian',
    bill: 100,
    email: 'johnabou@gmail.com',
    location: 'Cotonou'
)

Devi  = admin.doctors.create(
    name: 'Devi Shetty',
    speciality: 'surgery', 
    image: 'https://drive.google.com/file/d/1WqgoLJlMh6TovG1dmrdDhHm7ELCSnHKC/view?usp=sharing',
    reserved: true,
    description: 'Who is Devi Shetty, I don\'t know now',
    bill: 100,
    email: 'robertyonou@gmail.com',
    location: 'New York'
)

Christelle = admin.doctors.create(
    name: 'Christelle Santini',
    speciality: 'surgery', 
    image: 'https://drive.google.com/file/d/1FS2W0WAasHi6J7Vufvp4DAeqlNJeuxix/view?usp=sharing',
    reserved: false,
    description: 'Eric is a gastroenterologist in some hospital',
    bill: 100,
    email: 'eric@gmail.com',
    location: 'New York'
)

Mariam = admin.doctors.create(
    name: 'Mariam Makeba',
    speciality: 'pediatrician', 
    image: 'https://drive.google.com/file/d/1vdfXoG4E39u4Ac-ZrnlhBobK-c2a39Eu/view?usp=sharing',
    reserved: false,
    description: 'Mandala one of the greatest african leader',
    bill: 100,
    email: 'mandela@gmail.com',
    location: 'New York'
)

# reservation
user.reservations.create(date_reserved: '22-10-2022', city: 'Lome', duration: 20, doctor: Christina)
admin.reservations.create(date_reserved: '22-11-2022', city: 'India', duration: 2, doctor: Devi)

