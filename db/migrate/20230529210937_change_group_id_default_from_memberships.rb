class ChangeGroupIdDefaultFromMemberships < ActiveRecord::Migration[5.2]
  
  change_column :memberships, :group_id, :bigint, default: 2
end
