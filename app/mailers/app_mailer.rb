class AppMailer < ActionMailer::Base
 
  default from: 'samsingerjr@gmail.com'
 
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome!")
  end
end