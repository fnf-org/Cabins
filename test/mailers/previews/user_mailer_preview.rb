# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end

  def pre_registration
    user = User.first
    UserMailer.pre_registration(user)
  end

  def tier_approved
    user = User.first
    user.tier = Tier.first
    UserMailer.tier_approved(user)
  end

  def tier_open_email
    user = User.where.not('tier_id' => nil).first
    UserMailer.tier_open_email(Tier.first, ['invalid@invalid.com'])
  end
end
