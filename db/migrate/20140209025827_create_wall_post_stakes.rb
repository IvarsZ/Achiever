class CreateWallPostStakes < ActiveRecord::Migration
  def change
    create_table :wall_post_stakes do |t|
      t.string :stake_str

      t.timestamps
    end
  end
end
