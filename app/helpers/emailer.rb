class Emailer < ActionMailer::Base
end

class Emailer < ActionMailer::Base
	def contact(recipient, subject, message, sent_at = Time.now)
		@subject = subject
		@recipients = recipient
		@from = 'no-reply@yourdomain.com'
		@sent_on = sent_at
			@body["Title"] = 'Achiever - Title'
			@body["email"] = 'sender@yourdomain.com'
			@body["message"] = message
		@headers = {}
	end
end