require 'test_helper'

class ReservationMailerTest < ActionMailer::TestCase
  test "booking_confirmation" do
    mail = ReservationMailer.booking_confirmation
    assert_equal "Booking confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "paid_confirmation" do
    mail = ReservationMailer.paid_confirmation
    assert_equal "Paid confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
