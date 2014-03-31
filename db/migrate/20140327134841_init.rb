class Init < ActiveRecord::Migration
  def change

    create_table "culinary_terms", force: true do |t|
      t.string "name",        limit: 150, null: false
      t.text   "description"
    end

    add_index "culinary_terms", ["name"], name: "index_culinary_terms_on_name", unique: true, using: :btree

    create_table "ingredients", force: true do |t|
      t.string  "name",        limit: 150, null: false
      t.integer "left",                    null: false
      t.integer "right",                   null: false
      t.text    "description"
      t.integer "level",                   null: false
    end

    add_index "ingredients", ["name"], name: "index_ingredients_on_name", unique: true, using: :btree

    create_table "photos", force: true do |t|
      t.string  "file",          null: false
      t.integer "ingredient_id"
      t.integer "utensil_id"
    end

    add_index "photos", ["ingredient_id"], name: "index_photos_on_ingredient_id", using: :btree
    add_index "photos", ["utensil_id"], name: "index_photos_on_utensil_id", using: :btree

    create_table "recipe_ingredients", id: false, force: true do |t|
      t.integer "ingredient_id",                                    null: false
      t.integer "recipe_id",                                        null: false
      t.decimal "quantity",                 precision: 5, scale: 2
      t.string  "measure",       limit: 50
      t.integer "order",         limit: 2,                          null: false
    end

    add_index "recipe_ingredients", ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id", using: :btree
    add_index "recipe_ingredients", ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id", using: :btree

    create_table "recipe_instructions", force: true do |t|
      t.text    "instruction",           null: false
      t.integer "order",       limit: 2, null: false
      t.integer "recipe_id"
    end

    add_index "recipe_instructions", ["recipe_id"], name: "index_recipe_instructions_on_recipe_id", using: :btree

    create_table "recipe_tags", id: false, force: true do |t|
      t.integer "tag_id",    null: false
      t.integer "recipe_id", null: false
    end

    add_index "recipe_tags", ["recipe_id"], name: "index_recipe_tags_on_recipe_id", using: :btree
    add_index "recipe_tags", ["tag_id"], name: "index_recipe_tags_on_tag_id", using: :btree

    create_table "recipe_utensils", id: false, force: true do |t|
      t.integer "utensil_id", null: false
      t.integer "recipe_id",  null: false
    end

    add_index "recipe_utensils", ["recipe_id"], name: "index_recipe_utensils_on_recipe_id", using: :btree
    add_index "recipe_utensils", ["utensil_id"], name: "index_recipe_utensils_on_utensil_id", using: :btree

    create_table "recipes", force: true do |t|
      t.string  "name",                        null: false
      t.string  "dish",             limit: 30
      t.integer "nb_slices",        limit: 2
      t.integer "nb_people",        limit: 2
      t.string  "complexity",       limit: 30
      t.string  "taste",            limit: 30
      t.string  "balanced_diet",    limit: 30
      t.string  "cost",             limit: 30
      t.string  "continent"
      t.string  "country"
      t.string  "city"
      t.text    "wine"
      t.integer "preparation_time", limit: 2
      t.integer "cooking_time",     limit: 2
    end

    create_table "skill_descriptions", force: true do |t|
      t.text    "description", null: false
      t.integer "skill_id"
    end

    add_index "skill_descriptions", ["skill_id"], name: "index_skill_descriptions_on_skill_id", using: :btree

    create_table "skills", force: true do |t|
      t.string "name", null: false
    end

    add_index "skills", ["name"], name: "index_skills_on_name", unique: true, using: :btree

    create_table "tags", force: true do |t|
      t.string "name", limit: 100, null: false
    end

    add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

    create_table "utensils", force: true do |t|
      t.string "name",        null: false
      t.text   "description"
    end

    add_index "utensils", ["name"], name: "index_utensils_on_name", unique: true, using: :btree

  end
end
