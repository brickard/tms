class UserMailer < ActionMailer::Base
  default :from => "mailer@tabretailremodeling.com"
  def application_notification(user)
    @user = user
    @bcc = %w{ bram@craniumisajar.com bryonr@att.net }
    mail(:to => 'applyforjob@tabretailremodeling.com', 
         :bcc => @bcc, :subject => 'New Completed Application')
  end
end
