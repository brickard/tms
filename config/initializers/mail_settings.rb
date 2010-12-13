ActionMailer::Base.smtp_settings = {  
  :address              => "mail.tabretailremodeling.com",
  #:port                 => 587,  
  :port                 => 25,  
  :domain               => "tabretailremodeling.com",  
  :user_name            => "mailer",  
  :password             => "TroutBum",  
  :authentication       => "plain",  
  #:enable_starttls_auto => true  
}
ActionMailer::Base.delivery_method = :smtp
