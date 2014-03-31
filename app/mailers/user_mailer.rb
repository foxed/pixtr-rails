class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  def notify_on_new_activity(user, activity)
    @user = user
    @activity = activity
    mail(to: @user.email, subject: 'Welcome to Pixtr!')
  end
end
