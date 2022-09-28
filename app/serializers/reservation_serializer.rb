class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :date_reserved, :city 

  belongs_to :doctor
end
