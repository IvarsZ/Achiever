class ChangeDateToDateTimeInExerciseGoal < ActiveRecord::Migration
  def self.up
   change_column :exercise_goals, :goal_date, :datetime
  end

  def self.down
   change_column :exercise_goals, :goal_date, :date
  end
end
