# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
AchieverRails::Application.initialize!

# Setup for sending emails to the referees

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.server_settings = {
    :address => "smtp.tutorialspoint.com",
    :port => 25,
    :domain => "tutorialspoint.com",
    :authentication => :login,
    :user_name => "username",
    :password => "password",
}
ActionMailer::Base.default_content_type = "text/html"
