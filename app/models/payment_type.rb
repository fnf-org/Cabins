class PaymentType < ActiveRecord::Base
  has_many :reservations
end
