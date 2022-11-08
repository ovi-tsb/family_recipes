class CreateFriendconnects < ActiveRecord::Migration[5.2]
  def change
    create_table :friendconnects do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
