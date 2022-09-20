class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :date_reserved, :city, :duration

  belongs_to :doctor
end
