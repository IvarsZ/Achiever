class AddStakeIdToWallPostStake < ActiveRecord::Migration
  def change
    add_column :wall_post_stakes, :stake_id, :integer
  end
end
