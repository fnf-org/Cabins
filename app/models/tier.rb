class Tier 
  include Mongoid::Document

  has_many :users

  before_save :strip_whitespace

  validates :label, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :subject, presence: true, length: { maximum: 255 }
  validates :email_text, presence: true
  validates :email_html, presence: true

  def full_label
    "#{label}: #{description}"
  end

  private

  def strip_whitespace
    self.label = self.label.strip unless self.label.nil?
    self.description = self.description.strip unless self.description.nil?
    self.subject = self.subject.strip unless self.subject.nil?
    self.email_text = self.email_text.strip unless self.email_text.nil?
    self.email_html = self.email_html.strip unless self.email_html.nil?
  end
end
