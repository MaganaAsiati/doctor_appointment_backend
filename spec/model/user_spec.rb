require 'rails_helper'
RSpec.describe User, type: :model do
  before :each do
    @admin = User.create(name: 'assia', email: 'rida@gmail.com', password: '123456', role: 'admin')
    @user = User.create(name: 'assia', email: 'rida@gmail.com', password: '123456', role: 'visitor')
  end
    it 'user should be valid' do
      expect(@admin).to be_valid
    end
    it 'should not be nil' do
      @admin.name = nil
      expect(@admin).to_not be_valid
    end
    it 'should not be nil' do
      @admin.email = nil
      expect(@admin).to_not be_valid
    end
    it 'should not be nil' do
      @admin.password = nil
      expect(@admin).to_not be_valid
    end
    it 'user should be valid' do
      expect(@admin).to be_valid
    end
    it 'user should be an admin' do
      expect(@admin.admin?).to be_truthy
    end
    it 'user should not be an admin' do
      expect(@user.admin?).to be_falsy
    end
end