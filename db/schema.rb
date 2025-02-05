# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2025_02_05_111538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "custom_lists", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.bigint "person_id"
    t.index ["person_id"], name: "index_custom_lists_on_person_id"
  end

  create_table "custom_lists_films", force: :cascade do |t|
    t.bigint "custom_list_id", null: false
    t.bigint "film_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["custom_list_id"], name: "index_custom_lists_films_on_custom_list_id"
    t.index ["film_id"], name: "index_custom_lists_films_on_film_id"
  end

  create_table "films", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.bigint "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "poster_path"
    t.string "release_date"
    t.string "language"
    t.string "external_id"
    t.index ["genre_id"], name: "index_films_on_genre_id"
  end

  create_table "films_people", id: false, force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "person_id", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "film_id", default: [], array: true
  end

  create_table "watches", force: :cascade do |t|
    t.bigint "film_id"
    t.bigint "person_id"
    t.boolean "watched"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_watches_on_film_id"
    t.index ["person_id"], name: "index_watches_on_person_id"
  end

  add_foreign_key "custom_lists_films", "custom_lists"
  add_foreign_key "custom_lists_films", "films"
  add_foreign_key "films", "genres"
end
