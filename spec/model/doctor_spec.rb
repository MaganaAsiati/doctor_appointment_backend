require 'rails_helper'
RSpec.describe Doctor, type: :model do
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
end
    it 'should be valid' do
       expect(@doctor).to be_valid
    end
    it 'name should not be nil' do
      @doctor.name = nil
      expect(@doctor).to_not be_valid
    end
    it 'name should not be nil' do
      @doctor.name = nil
      expect(@doctor).to_not be_valid
    end
    it 'image should not be valid' do
      @doctor.image = nil
      expect(@doctor).to_not be_valid
    end
    it 'description should not be nil' do
      @doctor.description = nil
      expect(@doctor).to_not be_valid
    end
    it 'bill should not be nil' do
      @doctor.bill = nil
      expect(@doctor).to_not be_valid
    end
    it 'email should not be nil' do
      @doctor.email = nil
      expect(@doctor).to_not be_valid
    end
    it 'location should not be nil' do
      @doctor.location = nil
      expect(@doctor).to_not be_valid
    end
end
