class CreateExerciseGoals < ActiveRecord::Migration
  def change
    create_table :exercise_goals do |t|
      t.string :goal_str
      t.date :goal_date

      t.timestamps
    end
  end
end
