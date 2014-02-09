class AddLinkIdToStake < ActiveRecord::Migration
  def change
    add_column :stakes, :link_id, :integer
  end
end
