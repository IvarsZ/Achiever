class CreateWakeUpGoals < ActiveRecord::Migration
  def change
    create_table :wake_up_goals do |t|
      t.string :goal_str
      t.date :goal_date

      t.timestamps
    end
  end
end
