class CreateMembershipsAgain < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :member_id

      t.timestamps
    end
    remove_column :invitations, :group_id, :integer
  end
end
