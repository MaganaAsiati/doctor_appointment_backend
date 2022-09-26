class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :doctor, class_name: 'Doctor', foreign_key: 'doctor_id'


  after_save :update_reserved
  after_destroy :update_reserved

  def update_reserved

    if doctor.reservations.empty?
   
      doctor.update(reserved: false) if doctor.reserved
    else
      doctor.update(reserved: true) unless doctor.reserved
    end
  end
end

