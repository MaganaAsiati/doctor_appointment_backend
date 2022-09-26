# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users
user = User.create(name: 'User 1', email: 'user1@gmail.com', password: '123456' )
admin = User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin')


# doctors
Christina  = admin.doctors.create(
    name: 'Christina Milian',
    speciality: 'Neurology', 
    image: 'https://user-images.githubusercontent.com/95297251/192105518-81e2d20a-4990-470a-98a2-eb57c4242d07.png',
    description: 'some description about this Christina Milian',
    bill: 100,
    email: 'johnabou@gmail.com',
    location: 'Cotonou'
)

Devi  = admin.doctors.create(
    name: 'Devi Shetty',
    speciality: 'surgery', 
    image: 'https://user-images.githubusercontent.com/95297251/192105960-8fef4506-06b1-4ec9-8bd4-5bfdcfeead12.png',
    description: 'Who is Devi Shetty, I don\'t know now',
    bill: 100,
    email: 'robertyonou@gmail.com',
    location: 'New York'
)

Christelle = admin.doctors.create(
    name: 'Christelle Santini',
    speciality: 'surgery', 
    image: 'https://user-images.githubusercontent.com/95297251/192105806-4401e519-4c2a-4a51-aa5b-c0ce92eb0653.png',
    description: 'Eric is a gastroenterologist in some hospital',
    bill: 100,
    email: 'eric@gmail.com',
    location: 'New York'
)

Mariam = admin.doctors.create(
    name: 'Mariam Makeba',
    speciality: 'pediatrician', 
    image: 'https://user-images.githubusercontent.com/95297251/192105914-b22c7317-5a0c-4416-ab65-5e559e906cd3.png',
    description: 'Mandala one of the greatest african leader',
    bill: 100,
    email: 'mandela@gmail.com',
    location: 'New York'
)

# reservation
user.reservations.create(date_reserved: '22-10-2022', city: 'Lome', duration: 20, doctor: Christina)

admin.reservations.create(date_reserved: '22-11-2022', city: 'India', duration: 2, doctor: Devi)

