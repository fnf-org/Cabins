class ReservationMailer < ApplicationMailer
  helper :instant

  def booking_confirmation(reservation)
    @reservation = reservation
    mail to: reservation.user.email, subject: "FnF #{Time.new.year} Cabins Booking Confirmation"
  end

  def booking_canceled(user, accommodation)
    @accommodation = accommodation
    mail to: user.email, subject: "FnF #{Time.new.year} Cabins Booking Cancellation"
  end

  def paid_confirmation(reservation)
    @reservation = reservation
    mail to: reservation.user.email, subject: "FnF #{Time.new.year} Cabins Payment Confirmation"
  end
end
