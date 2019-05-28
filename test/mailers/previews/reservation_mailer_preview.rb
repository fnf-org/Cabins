# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/booking_confirmation
  def booking_confirmation
    reservation = Reservation.first
    ReservationMailer.booking_confirmation(reservation)
  end

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/booking_canceled
  def booking_canceled
    reservation = Reservation.first
    ReservationMailer.booking_canceled(reservation.user, reservation.accommodation)
  end

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/paid_confirmation
  def paid_confirmation
    reservation = Reservation.first
    ReservationMailer.paid_confirmation(reservation)
  end

end
