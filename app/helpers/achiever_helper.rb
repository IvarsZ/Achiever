module AchieverHelper


  def schedule_new_confirmation(date, achievement_id)
	#g_type = Achievment.find(achievement_id).goal.goal_type
	#case g_type
#		when "WakeUpGoal"
		##	date = WakeUpGoal.find(link_id).goal_date
	#	when "ExerciseGoal"
           #date = ExerciseGoal.find(link_id).goal_date
	#end

	ActionMailer::Base.mail(:from => "achiever.app.ef@gmail.com", :to => "achiever.app.ef@gmail.com", :subject => "test_before_scheduler", :body => "test").deliver
	scheduler = Rufus::Scheduler.new
	puts date
	scheduler.at  date do
		#Call method to ask ref for confirmation
		puts "IUASDOI:ASJKRNSEFLIKJ"
		email_referee(achievement_id)
	end

  end

  private

    def email_referee(achievement_id)
		#ask for confirmation from the referee
		#code to send out yes/no confirmation message via
		#person being judeged, get goals, stakes, referee id, 
		#compact and form message
		#User.find(1).fb_id
		#email = Achievment.find(achievement_id).referee_email


		#referee = Achievment.find(achievement_id).referee_id
		#achiever = Achievment.find(achievement_id).user_id
		#goals = Achievment.find(achievement_id).goal
		#message = "Hello " + referee + ", has your friend " + achiever + " completed his goal of: " + goals

		#MyMailer::deliver_mail("neilhutch4@gmail.com")
		ActionMailer::Base.mail(:from => "achiever.app.ef@gmail.com", :to => "achiever.app.ef@gmail.com", :subject => "test schedule", :body => "test").deliver
		puts "test"
    end



end