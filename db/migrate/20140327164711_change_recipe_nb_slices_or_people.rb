class ChangeRecipeNbSlicesOrPeople < ActiveRecord::Migration
  def change
    remove_column :recipes, :nb_slices
    remove_column :recipes, :nb_people
    add_column :recipes, :nb_slices, :integer, limit:2
    add_column :recipes, :type_slices, :string, limit:15
  end
end
