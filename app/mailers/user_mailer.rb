class UserMailer < ActionMailer::Base
  default :from => "mailer@tabretailremodeling.com"
  def application_notification(user)
    @user = user
    #mail(:to => 'applyforjob@tabretailremodeling.com', 
    #     :subject => 'New Completed Application')
    mail(:to => 'bram@craniumisajar.com, bryonr@att.net', 
         :subject => 'New Completed Application')
    #mail(:to => 'bryonr@att.net', 
    #     :subject => 'New Completed Application')
  end
end
