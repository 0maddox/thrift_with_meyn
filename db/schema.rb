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

ActiveRecord::Schema[7.0].define(version: 2023_08_18_150604) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clothing_items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "size"
    t.string "color"
    t.decimal "price"
    t.string "picture"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_clothing_items_on_category_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "clothing_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothing_item_id"], name: "index_favorites_on_clothing_item_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "jwt_denylists", force: :cascade do |t|
    t.string "jti", default: "", null: false
    t.string "token"
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylists_on_jti", unique: true
    t.index ["token"], name: "index_jwt_denylists_on_token", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "clothing_item_id", null: false
    t.string "payment_status"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothing_item_id"], name: "index_payments_on_clothing_item_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "clothing_item_id", null: false
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothing_item_id"], name: "index_ratings_on_clothing_item_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "clothing_item_id", null: false
    t.string "payment_status"
    t.decimal "reserved_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothing_item_id"], name: "index_reservations_on_clothing_item_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 20, null: false
    t.string "email", limit: 50, null: false
    t.string "password_digest", null: false
    t.string "role", default: "regular"
    t.boolean "admin", default: false
    t.string "profile_picture", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clothing_items", "categories"
  add_foreign_key "favorites", "clothing_items"
  add_foreign_key "favorites", "users"
  add_foreign_key "payments", "clothing_items"
  add_foreign_key "payments", "users"
  add_foreign_key "ratings", "clothing_items"
  add_foreign_key "ratings", "users"
  add_foreign_key "reservations", "clothing_items"
  add_foreign_key "reservations", "users"
end
