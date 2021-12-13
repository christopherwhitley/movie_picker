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

ActiveRecord::Schema.define(version: 2021_12_12_115705) do

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "genre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_films_on_genre_id"
  end

  create_table "films_people", id: false, force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "person_id", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.text "film_id", default: "--- []\n"
  end

  create_table "watches", force: :cascade do |t|
    t.integer "watched_film_id"
    t.integer "watched_person_id"
    t.boolean "watched"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["watched_film_id"], name: "index_watches_on_watched_film_id"
    t.index ["watched_person_id"], name: "index_watches_on_watched_person_id"
  end

  add_foreign_key "films", "genres"
end
