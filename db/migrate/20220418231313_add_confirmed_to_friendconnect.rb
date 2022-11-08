class AddConfirmedToFriendconnect < ActiveRecord::Migration[5.2]
  def change
    add_column :friendconnects, :confirmed, :boolean, default: false
  end
end
