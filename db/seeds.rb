# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users
User.create(name: 'User 1', email: 'user1@gmail.com', password: '123456')
User.create(name: 'admin', email: 'admin@gamil.com', password: '123456', role: 'admin')

# doctors
Doctor.create(
    name: 'John abou',
    speciality: 'Neurology', 
    image: 'https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?w=2000',
    reserved: true,
    description: 'some description about this John abou',
    bill: 100,
    email: 'johnabou@gmail.com',
    location: 'Cotonou'
)

Doctor.create(
    name: 'Robert Yonou',
    speciality: 'Neurology', 
    image: 'https://media.istockphoto.com/photos/happy-healthcare-practitioner-picture-id138205019?k=20&m=138205019&s=612x612&w=0&h=KpsSMVsplkOqTnAJmOye4y6DcciVYIBe5dYDgYXLVW4=',
    reserved: true,
    description: 'Who is Robert yonou, I don\'t know now',
    bill: 100,
    email: 'robertyonou@gmail.com',
    location: 'New York'
)