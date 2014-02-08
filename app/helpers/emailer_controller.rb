class EmailerController < ApplicationCOntroller
		def sendmail
				email = @params["email"]
					recipient = email["recipient"]
					subject = email["subject"]
					message = email["message"]
				Emailer.deliever_contact(recipient, subject, message)
				return if request.xhr?
				render :text => 'Message sent successfully'
		end
end