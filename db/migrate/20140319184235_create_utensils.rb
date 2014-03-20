class CreateUtensils < ActiveRecord::Migration
  def change
    create_table :utensils do |t|
      t.string :name, null:false
      t.string :description, null:true
    end
  end
end
