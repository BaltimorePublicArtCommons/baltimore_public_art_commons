class UserMailer < ActionMailer::Base
  default from: "publicartcommons@gmail.com"

  def invitation_email
    @user = user
    @url = 'publicartcommons.org/signup'
    mail(to: ) #get from form ...
  end
end
