class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :speciality, :image, :reserved, :description, :bill, :email, :location

  has_many :reservations
end
