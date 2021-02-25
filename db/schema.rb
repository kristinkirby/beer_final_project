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

ActiveRecord::Schema.define(version: 2021_02_25_184327) do

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.integer "brewery_id"
    t.string "abv"
    t.string "ibu"
    t.string "description"
    t.string "image"
    t.integer "style_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "phone_number"
    t.string "website"
    t.string "logo_image"
    t.string "description"
    t.integer "beers_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "banner_image"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flags", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beer_id"
    t.string "rating"
    t.string "rating_comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.string "origin"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "display_name"
    t.string "name"
    t.string "photo"
    t.date "dob"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
