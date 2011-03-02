class UserMailer < ActionMailer::Base
  default :from => "mailer@magnumrr.net"
  def application_notification(user)
    @user = user
    mail(:to => 'applyforjob@magnumrr.net', 
         :bcc => @bcc, :subject => 'New Completed Application')
  end
end
