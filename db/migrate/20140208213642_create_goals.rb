class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :link_type
      t.integer :link_id
      t.integer :achievment_id

      t.timestamps
    end
  end
end
