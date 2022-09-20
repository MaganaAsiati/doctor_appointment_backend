class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role
  # has_many :reservations
  # has_many :doctors
end
