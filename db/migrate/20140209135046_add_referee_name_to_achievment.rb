class AddRefereeNameToAchievment < ActiveRecord::Migration
  def change
    add_column :achievments, :referee_name, :string
  end
end
