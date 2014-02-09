class AddRefereeEmailToAchievment < ActiveRecord::Migration
  def change
    add_column :achievments, :referee_email, :string
  end
end
