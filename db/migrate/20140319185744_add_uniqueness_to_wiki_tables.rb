class AddUniquenessToWikiTables < ActiveRecord::Migration
  def change
    add_index :ingredients, :name, unique: true
    add_index :skills, :name, unique: true
    add_index :utensils, :name, unique: true
  end
end
