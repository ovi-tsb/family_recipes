class AddPositionToDirections < ActiveRecord::Migration[5.2]
  def change
    add_column :directions, :position, :integer
  end
end
