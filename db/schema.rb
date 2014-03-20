# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140320160912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: true do |t|
    t.string  "name",        limit: 150, null: false
    t.integer "left_side",               null: false
    t.integer "right_side",              null: false
    t.string  "description"
    t.integer "level",                   null: false
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", unique: true, using: :btree

  create_table "skills", force: true do |t|
    t.string "name",        null: false
    t.string "description"
  end

  add_index "skills", ["name"], name: "index_skills_on_name", unique: true, using: :btree

  create_table "utensils", force: true do |t|
    t.string "name",        null: false
    t.string "description"
  end

  add_index "utensils", ["name"], name: "index_utensils_on_name", unique: true, using: :btree

end
