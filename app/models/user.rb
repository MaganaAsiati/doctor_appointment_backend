class User < ApplicationRecord
  has_secure_password

  has_many :reservations
  has_many :doctors
  has_many :doctors_reservations, through: :reservations, source: :user

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true
  
end
