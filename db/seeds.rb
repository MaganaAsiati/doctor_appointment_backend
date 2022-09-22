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
john = admin.doctors.create(
    name: 'John abou',
    speciality: 'Neurology', 
    image: 'https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?w=2000',
    reserved: true,
    description: 'some description about this John abou',
    bill: 100,
    email: 'johnabou@gmail.com',
    location: 'Cotonou'
)

robert = admin.doctors.create(
    name: 'Robert Yonou',
    speciality: 'Pediatrics', 
    image: 'https://media.istockphoto.com/photos/happy-healthcare-practitioner-picture-id138205019?k=20&m=138205019&s=612x612&w=0&h=KpsSMVsplkOqTnAJmOye4y6DcciVYIBe5dYDgYXLVW4=',
    reserved: true,
    description: 'Who is Robert yonou, I don\'t know now',
    bill: 100,
    email: 'robertyonou@gmail.com',
    location: 'New York'
)

eric = admin.doctors.create(
    name: 'Eric Toyota',
    speciality: 'Gastroenterology', 
    image: 'https://www.liveabout.com/thmb/Mqg14bq1UVVrFdrasruRbTC-m0M=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/doctor-with-stethoscope-in-hospital-642394515-5aa9a0b8a9d4f90037431454.jpg',
    reserved: true,
    description: 'Eric is a gastroenterologist in some hospital',
    bill: 100,
    email: 'eric@gmail.com',
    location: 'New York'
)

mandela = admin.doctors.create(
    name: 'Mandela',
    speciality: 'cardiology', 
    image: 'https://familydoctor.org/wp-content/uploads/2018/02/41808433_l-705x470.jpg',
    reserved: true,
    description: 'Mandala one of the greatest african leader',
    bill: 100,
    email: 'mandela@gmail.com',
    location: 'New York'
)

# reservation
user.reservations.create(date_reserved: '22-10-2022', city: 'Lome', duration: 20, doctor: john)
admin.reservations.create(date_reserved: '22-11-2022', city: 'Accra', duration: 2, doctor: robert)
