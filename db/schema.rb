# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_22_012054) do

  create_table "fighter_moves", force: :cascade do |t|
    t.integer "fighter_id"
    t.integer "move_id"
    t.index ["fighter_id"], name: "index_fighter_moves_on_fighter_id"
    t.index ["move_id"], name: "index_fighter_moves_on_move_id"
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "attack"
    t.integer "defense"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "base_damage"
    t.integer "minimum_to_hit"
    t.integer "when_to_critical"
    t.integer "when_to_damage_self"
  end

  add_foreign_key "fighter_moves", "fighters"
  add_foreign_key "fighter_moves", "moves"
end
