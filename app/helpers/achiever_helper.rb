module AchieverHelper

  def schedule_new_confirmation(date, achievement_id)
	  g_type = Achievment.find(achievement_id).goal.goal_type
	  case g_type
      when "WakeUpGoal"
        date = WakeUpGoal.find(link_id).goal_date
      when "ExerciseGoal"
        date = ExerciseGoal.find(link_id).goal_date
    end

    scheduler = Rufus::Scheduler.new
    puts "**************"
    puts date
    puts "************"
    scheduler.at  date do
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
      achievment = Achievment.find(achievement_id)
		  email = Achievment.find(achievement_id).referee_email


		  #achiever = Achievment.find(achievement_id).user
      achiever = "IVARS"
		  goal = Achievment.find(achievement_id).goal
      case goal.goal_type
        when "exercise"
		      message = "Hello , has your friend " + achiever + " completed his goal of: " + ExerciseGoal.find(goal.link_id).goal_str
        when "wakup"
		      message = "Hello , has your friend " + achiever + " completed his goal of: " + WakeUpGoal.find(goal.link_id).goal_str, "\n"
      end

      message += URI.join(root_url, confirm_achievment_path(achievment.id)), "\n"
      message += URI.join(root_url, execute_stake_path(achievment.stake.id)), "\n"
      puts message

		  ActionMailer::Base.mail(from: "achiever.app.ef@gmail.com", to: email, subject: "Confirm Achievement", body:  message).deliver
    end
end
