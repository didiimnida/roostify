class UserMailer < ApplicationMailer

  default from: "diana.hilton@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Dianaify")
  end
end
