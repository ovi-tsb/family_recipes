class AddPositionToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :position, :integer
  end
end
