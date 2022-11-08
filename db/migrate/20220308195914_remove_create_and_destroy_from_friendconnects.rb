class RemoveCreateAndDestroyFromFriendconnects < ActiveRecord::Migration[5.2]
  def change
    remove_column :friendconnects, :create, :string
    remove_column :friendconnects, :destroy, :string
  end
end
