class CreateStakes < ActiveRecord::Migration
  def change
    create_table :stakes do |t|
      t.integer :achievment_id
      t.string :stake_type

      t.timestamps
    end
  end
end
