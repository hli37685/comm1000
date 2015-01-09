class AppMailer < ActionMailer::Base
 
  default from: 'mcculj1@auburn.edu'
 
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "COMM1000 & COMM1003")
  end
end