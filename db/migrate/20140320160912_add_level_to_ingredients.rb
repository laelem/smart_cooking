class AddLevelToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :level, :integer, null:false
  end
end
