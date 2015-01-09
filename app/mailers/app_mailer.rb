class AppMailer < ActionMailer::Base
 
  default from: 'mcculj1@auburn.edu'
 
  def welcome_email(user)
    @user = user
    @user.email = @user.email.to_s + "@auburn.edu" # this line for AU userid instead of email in db
    mail(to: @user.email, subject: "COMM1000 & COMM1003")
  end
end