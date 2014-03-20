class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name, null:false, limit:150
      t.integer :left_side, null:false
      t.integer :right_side, null:false
      t.string :description, null:true
    end
  end
end