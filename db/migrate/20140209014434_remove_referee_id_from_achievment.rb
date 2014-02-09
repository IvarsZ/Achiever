class RemoveRefereeIdFromAchievment < ActiveRecord::Migration
  def change
    remove_column :achievments, :referee_id, :integer
  end
end
