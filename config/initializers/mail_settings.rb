ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",
  :domain               => "gmail.com",  
  :user_name            => "tabmailer",  
  :password             => "!mailer!",  
  :authentication       => "plain",
  :port                 => 587,  
  :enable_starttls_auto => true,
  #:address              => "mail.tabretailremodeling.com",
  #:domain               => "tabretailremodeling.com",  
  #:user_name            => "mailer",  
  #:password             => "TroutBum",  
  #:authentication       => "plain"
  #:port                 => 25,  
}
ActionMailer::Base.delivery_method = :smtp
