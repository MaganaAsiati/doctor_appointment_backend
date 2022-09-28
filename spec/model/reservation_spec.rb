require 'rails_helper'
RSpec.describe Reservation, type: :model do
  before :each do
@admin = User.create(name: 'assia', email: 'rida@gmail.com', password: '123456', role: 'admin')
  @doctor = @admin.doctors.create(
  name: 'lila',
  speciality: 'Neurology',
  image: 'https://user-images.githubusercontent.com/95297251/192105518-81e2d20a-4990-470a-98a2-eb57c4242d07.png',
  description: 'some description about this Christina Milian',
  bill: 100,
  email: 'lila@gmail.com',
  location: 'Cotonou')
  @lili = @admin.doctors.create(
    name: 'lila',
    speciality: 'Neurology',
    image: 'https://user-images.githubusercontent.com/95297251/192105518-81e2d20a-4990-470a-98a2-eb57c4242d07.png',
    description: 'some description about this Christina Milian',
    bill: 100,
    email: 'lila@gmail.com',
    location: 'Cotonou')
@Reservation = @admin.reservations.create(date_reserved: '22-10-2022',city: 'Lome', doctor: @doctor)
end
it 'Reservation should be valid' do
  expect(@Reservation).to be_valid
end
it 'date_reserved should not be nil' do
  @Reservation.date_reserved = nil
  expect(@Reservation).to be_valid
end
it 'city should not be nil' do
  @Reservation.city = nil
  expect(@Reservation).to be_valid
end
it 'duration should not be nil' do
  @Reservation.update_reserved
  expect(@doctor.reserved).to be_truthy
end
it 'duration should not be nil' do
  @Reservation.update_reserved
  expect(@lili.reserved).to be_falsy
end
end