class UserMailer < ActionMailer::Base
  default :from => "mailer@tabretailremodeling.com"
  def application_notification(user)
    @user = user
    mail(:to => 'applyforjob@tabretailremodeling.com', 
         :bcc => @bcc, :subject => 'New Completed Application')
  end
end
