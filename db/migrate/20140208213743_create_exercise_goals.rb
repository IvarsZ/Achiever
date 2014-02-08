class CreateExerciseGoals < ActiveRecord::Migration
  def change
    create_table :exercise_goals do |t|
      t.date :finish_date
      t.integer :times

      t.timestamps
    end
  end
end
