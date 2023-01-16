class AccommodationType 
  include Mongoid::Document
  has_many :accommodations
end
