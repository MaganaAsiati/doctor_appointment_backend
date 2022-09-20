class User < ApplicationRecord
  has_many :reservations
  has_many :doctors
  has_many :doctors_reservations, through: :reservations, source: :user

  validates :name, presence: true, uniqueness: true
end
