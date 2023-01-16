class BuildingType 
  include Mongoid::Document
  has_many :buildings
end
