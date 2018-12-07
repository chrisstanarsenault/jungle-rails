class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(user)
    @user = user 
    @url = 'http//example.com/login'
    mail(to: @user.email, subject: 'Test test test')
  end
end
