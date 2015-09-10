class UserMailer < ApplicationMailer

  default from: "diana.hilton@gmail.com"

  def loan_email(user)
    @user = user
    mail(to: @user.email, subject: "Your loan has been approved by Dianaify!")
  end
end
