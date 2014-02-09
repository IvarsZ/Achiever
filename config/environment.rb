# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
AchieverRails::Application.initialize!

# Setup for sending emails to the referees

ActionMailer::Base.delivery_method = :smtp 
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = { 
	:enable_starttls_auto => true,  
	:address 		 => "smtp.gmail.com",   
	:port            => 587,
   # :tls             => true,
    :authentication  => :plain,
   # :domain => ''
    :user_name       => 'achiever.app.ef@gmail.com',
    :password        => 'achiever123'
}
