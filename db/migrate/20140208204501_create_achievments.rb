class CreateAchievments < ActiveRecord::Migration
  def change
    create_table :achievments do |t|
      t.string :referee_id
      t.boolean :completed
      t.integer :user_id

      t.timestamps
    end
  end
end
