class UserMailer < ActionMailer::Base
  default from: "no-reply@publicartcommons.org"
  layout 'mailer'

  def invitation_email(user_id)
    @user = User.find user_id
    @subject = "Help us document Baltimore's Public Art!"
    mail to: @user.email, subject: @subject
  end
end
