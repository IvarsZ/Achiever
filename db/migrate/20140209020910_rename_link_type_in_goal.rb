class RenameLinkTypeInGoal < ActiveRecord::Migration
  def change
    rename_column :goals, :link_type, :goal_type
  end
end
