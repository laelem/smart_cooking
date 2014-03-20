# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def insert_ing(ingredients, i = 2, level = 1)
  ingredients.each do |ing|
    if ing.class == String
      Ingredient.create!(name: ing, left_side: i, right_side: i+1, level: level)
      i = i + 2
    else
      ing.each do |key, value|
        size = value.inspect.scan(/"[^"]*"/).length
        Ingredient.create!(name: key, left_side: i, right_side: i + size*2 + 1, level: level)
        insert_ing(value, i+1, level+1)
        i = i + size*2 + 2
      end
    end
  end
  return i
end

i = insert_ing(YAML.load_file(Rails.root.join('db', 'seeds', 'ingredients.yml')))
Ingredient.create!(name: 'root', left_side: 1, right_side: i, level: 0)