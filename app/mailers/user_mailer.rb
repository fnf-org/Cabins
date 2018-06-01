class UserMailer < ApplicationMailer

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'FnF Cabins Password Reset'
  end

  def pre_registration(user)
    @user = user
    mail to: user.email, subject: "Welcome to FnF #{Time.new.year} Cabins"
  end

  def tier_approved(user)
    @user = user
    mail to: user.email, subject: "#{Time.new.year} FnF Cabins and Lodging Tier Assignment"
  end
end
