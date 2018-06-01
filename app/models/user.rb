class User < ActiveRecord::Base
  belongs_to :tier, optional: true
  has_many :reservations, foreign_key: :user_id
  has_many :processed_reservations, class_name: 'Reservation', foreign_key: :processed_by_user_id
  attr_accessor :reset_token

  @allowed_roles = %w(planner planner_medical attendee)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_validation { self.phone = phone.gsub(/[^0-9]/, '') }
  before_save { self.email = email.downcase }
  before_save :strip_whitespace

  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, :if => :password
  validates :phone, presence: true, length: { maximum: 16 }
  validates :role, presence: true, length: { maximum: 20 }, :inclusion => { :in => @allowed_roles }

  has_secure_password

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def send_pre_registration_email
    UserMailer.pre_registration(self).deliver_now
  end

  def send_tier_approved_email
    UserMailer.tier_approved(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def send_preregistration_email
    UserMailer.pre_registration(self).deliver_now
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def has_confirmed_reservations?
     reservations = Reservation.where('confirmed_time IS NOT NULL AND user_id=?', self.id)
     !reservations.empty?
  end

  def self.search(params)
    rv = where(nil)

    if params[:search]
      parm = "%#{params[:search]}%"
      rv = rv.where('users.name LIKE ?', parm)
    end

    rv
  end

  private
    def strip_whitespace
      self.name = self.name.strip unless self.name.nil?
      self.email = self.email.strip unless self.email.nil?
      self.phone = self.phone.strip unless self.phone.nil?
      self.notes = self.notes.strip unless self.notes.nil?
    end
end
