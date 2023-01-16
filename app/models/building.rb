class Building 
  include Mongoid::Document
  belongs_to :building_type
  has_many :accommodations
end
