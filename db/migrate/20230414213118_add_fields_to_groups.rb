class AddFieldsToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :user_id, :integer
    add_column :memberships, :group_id, :integer
    add_column :memberships, :user_id, :integer
  end
end
