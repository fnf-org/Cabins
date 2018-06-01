class Tier < ActiveRecord::Base
  has_many :users

  def full_label
   "#{label}: #{description}"
  end
end
