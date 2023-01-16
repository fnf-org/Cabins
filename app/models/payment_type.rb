class PaymentType 
  include Mongoid::Document
  has_many :reservations
end
