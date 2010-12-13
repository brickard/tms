ActionMailer::Base.smtp_settings = {  
  #:port                 => 587,  
  :enable_starttls_auto => true,
  :port                 => 25,  
  :address              => "mail.tabretailremodeling.com",
  :domain               => "tabretailremodeling.com",  
  :user_name            => "mailer",  
  :password             => "TroutBum",  
  :authentication       => "plain"
}
ActionMailer::Base.delivery_method = :smtp
