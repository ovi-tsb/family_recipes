class AddDefaultValueToGroupIdInMembership < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :memberships, :group_id, default: 2
  end
end
