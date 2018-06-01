class Reservation < ActiveRecord::Base
  belongs_to :accommodation
  belongs_to :processed_by_user, :class_name => 'User', optional: true
  belongs_to :user, :class_name => 'User'
  belongs_to :payment_type, foreign_key: :payment_types_id, optional: true

  def send_booking_confirmation_email
    ReservationMailer.booking_confirmation(self).deliver_now
  end

  def send_paid_confirmation_email
    ReservationMailer.paid_confirmation(self).deliver_now
  end

  def self.search(params)
    rv = where('confirmed_time IS NOT NULL')
          .joins("LEFT OUTER JOIN users u ON u.id=reservations.user_id")
          .joins("LEFT OUTER JOIN accommodations a ON a.id=reservations.accommodation_id")

    if params[:search]
      parm = "%#{params[:search]}%"
      rv = rv.where('u.name LIKE ? OR u.email LIKE ? OR a.label LIKE ?', parm, parm, parm)
    end

    rv
  end
end
