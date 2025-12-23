class UserMailer < ApplicationMailer
  def verified_email(user)
    @user = user
    mail(to: @user.email, subject: "You account has been verified!")
  end

  def unverified_email(user)
    @user = user
    mail(to: @user.email, subject: "Your account has been unverified.")
  end
end
