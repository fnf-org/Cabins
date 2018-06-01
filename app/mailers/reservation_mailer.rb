class ReservationMailer < ApplicationMailer

  def booking_confirmation(reservation)
    @reservation = reservation
    mail to: reservation.user.email, subject: "FnF #{Time.new.year} Cabins Booking Confirmation"
  end

  def paid_confirmation(reservation)
    @reservation = reservation
    mail to: reservation.user.email, subject: "FnF #{Time.new.year} Cabins Payment Confirmation"
  end
end
