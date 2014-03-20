class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, null:false
      t.string :description, null:true
    end
  end
end