class MakeGroupsGlobal < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :user_id, :integer
    add_column :invitations, :group_id, :integer
    drop_table :memberships
  end
end
