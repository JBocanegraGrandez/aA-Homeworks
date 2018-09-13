class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'http://google.com/'
    mail(to: user.email, subject: "Welcome to Cat's rental")
  end

end
