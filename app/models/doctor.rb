class Doctor < ApplicationRecord

    validates :name, presence: true, length: { in: 3..50, message: 'Name\'s length should be in range of 3 to 50'}
    validates :speciality, presence: true, length: {in: 3..100, message: 'Speciality\'s length should be in range of 3 to 100'}
    validates :image, presence: true
    validates :reserved, presence: true
    validates :bill, presence: true
    validates :email, presence: true
    validates :location, presence: true, length: {in: 2..100, message: 'Location\'s length should be in range of 2 to 100'}
    validates :description, presence: true, numericality: true
end
