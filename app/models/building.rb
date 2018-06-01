class Building < ActiveRecord::Base
  belongs_to :building_type
  has_many :accommodations
end
