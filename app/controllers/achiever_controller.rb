class AchieverController < ApplicationController
  def index
  end

  def create_achievment
    respond_to do |format|
      
      @user = User.where(fb_id: params[:user][:fb_id]).first
      if @user.nil?
        @user = User.new(user_params)
      else
        @user.fb_token = params[:user][:fb_token]
      end

      @achievment = Achievment.new(achievment_params)
      @user.achievments << @achievment

      @goal = Goal.new(goal_params)
      case params[:goal][:goal_type]
        when "exercise"
          @goal_link = ExerciseGoal.new(exercise_goal_params)
        when "wakeup"
          @goal_link = WakeUpGoal.new(wake_up_goal_params)
      end

      @stake = Stake.new(stake_params)
      case params[:stake][:stake_type]
        when "facebookpost"
          @stake_link = WallPostStake.new(wall_post_stake_params)
      end

      @goal_link.save
      @goal.link_id = @goal_link.id
      @goal.save

      @stake_link.stake = @stake
      @stake_link.save
      @stake.link_id = @stake_link.id
      @stake.save

      @achievment.goal = @goal
      @achievment.stake = @stake
      @achievment.save

      @user.save

      puts "*******"
      puts goal.goal_date
      puts achievment.id
      puts "*****************"
      schedule_new_confirmation(goal.goal_date, achievement.id)

      format.json {render json: {success: true}}
    end  
  end

  def execute_stake    
    @stake = Stake.find(params[:id])
    case @stake.stake_type
      when "facebookpost"
        WallPostStake.find(@stake.link_id).post
    end
  end

  def confirm_achievment
   @achievment = Achievment.find(params[:id])
   @achievment.completed = true
   @achievment.save
  end

  private
   
    def user_params
      params.require(:user).permit(:fb_id, :fb_token)
    end

    def achievment_params
      params.require(:achievment).permit(:referee_email)
    end

    def goal_params
      params.require(:goal).permit(:goal_type)
    end

    def exercise_goal_params
      params.require(:goal).permit(:goal_str, :goal_date)
    end

    def wake_up_goal_params
      params.require(:goal).permit(:goal_str, :goal_date)
    end

    def stake_params
      params.require(:stake).permit(:stake_type)
    end

    def wall_post_stake_params
      params.require(:stake).permit(:stake_str)
    end
end
