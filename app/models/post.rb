class Post < ActiveRecord::Base
  @allowed_categories = %w(home rule faq)

  validates :category, presence: true, length: { maximum: 40 }, :inclusion => { :in => @allowed_categories }
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
end
