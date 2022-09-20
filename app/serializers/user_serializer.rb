class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :reservations
  has_many :doctors
  has_many :doctors_reservations, through: :reservations, source: :user
end
