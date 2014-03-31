# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Ingredients
puts "Seeding : ingredients..."

def insert_ing(ingredients, i = 2, level = 1)
  ingredients.each do |ing|
    if ing.class == String
      Ingredient.create!(name: ing, left: i, right: i+1, level: level)
      i = i + 2
    else
      ing.each do |key, value|
        size = value.inspect.scan(/"[^"]*"/).length
        Ingredient.create!(name: key, left: i, right: i + size*2 + 1, level: level)
        insert_ing(value, i+1, level+1)
        i = i + size*2 + 2
      end
    end
  end
  return i
end

i = insert_ing(YAML.load_file(Rails.root.join('db', 'seeds', 'ingredients.yml')))
Ingredient.create!(name: 'root', left: 1, right: i, level: 0)


# Skills
puts "Seeding : skills..."

YAML.load_file(Rails.root.join('db', 'seeds', 'skills.yml')).each do |skill|
  s = Skill.create!(name: skill['name'])
  if skill['desc'].class == String
    SkillDescription.create!(description: skill['desc'], skill_id: s.id)
  else
    skill['desc'].each do |value|
      SkillDescription.create!(description: value, skill_id: s.id)
    end
  end
end


# Utensils
puts "Seeding : utensils..."

YAML.load_file(Rails.root.join('db', 'seeds', 'utensils.yml')).each do |utensil|
  Utensil.create!(name: utensil['name'], description: utensil['desc'])
end


# Culinary terms
puts "Seeding : culinary terms..."

YAML.load_file(Rails.root.join('db', 'seeds', 'culinary_terms.yml')).each do |term|
  CulinaryTerm.create!(name: term['name'], description: term['desc'])
end
