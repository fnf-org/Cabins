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

  def tier_open_email(tier, user_emails)
    mail(to: 'fnfreservations@gmail.com', bcc: user_emails) do |format|
      format.text {render plain: tier.email_text}
      format.html {render html: tier.email_html.try(:html_safe)}
    end
  end
end
