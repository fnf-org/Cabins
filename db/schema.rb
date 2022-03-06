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

ActiveRecord::Schema[7.0].define(version: 2019_05_18_193921) do
  create_table "accommodation_types", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "description"
    t.string "label", limit: 20, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "accommodations", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.integer "accommodation_type_id", null: false
    t.integer "building_id", null: false
    t.boolean "air_conditioning", null: false
    t.boolean "bathroom", null: false
    t.string "description"
    t.boolean "hold", null: false
    t.boolean "kitchen", null: false
    t.string "label", limit: 40, null: false
    t.integer "occupancy", null: false
    t.decimal "price", precision: 12, scale: 2, null: false
    t.integer "quantity", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["accommodation_type_id"], name: "index_accommodations_on_accommodation_type_id"
    t.index ["building_id"], name: "index_accommodations_on_building_id"
  end

  create_table "building_types", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "description"
    t.string "label", limit: 20, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "buildings", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.integer "building_type_id", null: false
    t.string "description"
    t.string "image"
    t.string "label", limit: 40, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["building_type_id"], name: "index_buildings_on_building_type_id"
  end

  create_table "email_logs", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "email_type"
    t.integer "user_id"
    t.integer "tier_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["tier_id"], name: "index_email_logs_on_tier_id"
    t.index ["user_id"], name: "index_email_logs_on_user_id"
  end

  create_table "instants", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "instant", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name"], name: "index_instants_on_name", unique: true
  end

  create_table "payment_types", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "label", limit: 20, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "planners", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "posts", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "category", limit: 40
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "display_order", default: 50
  end

  create_table "reservations", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.integer "accommodation_id", null: false
    t.integer "processed_by_user_id"
    t.integer "user_id", null: false
    t.datetime "paid_date", precision: nil
    t.integer "payment_types_id"
    t.decimal "payment_amount", precision: 12, scale: 2
    t.decimal "price", precision: 12, scale: 2, null: false
    t.integer "quantity", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "note"
    t.index ["accommodation_id"], name: "index_reservations_on_accommodation_id"
    t.index ["payment_types_id"], name: "index_reservations_on_payment_types_id"
    t.index ["processed_by_user_id"], name: "index_reservations_on_processed_by_user_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "tiers", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "label", limit: 40, null: false
    t.string "description", null: false
    t.datetime "available", precision: nil, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "sent_date", precision: nil
    t.text "email_html"
    t.text "email_text"
    t.string "subject"
  end

  create_table "users", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "name", limit: 60, null: false
    t.string "email", null: false
    t.boolean "admin", default: false, null: false
    t.text "notes"
    t.string "password_digest"
    t.string "phone", limit: 16, null: false
    t.boolean "planner_found", default: false, null: false
    t.string "role", limit: 20, null: false
    t.integer "tier_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "reset_digest"
    t.datetime "reset_sent_at", precision: nil
    t.datetime "tier_approved_email", precision: nil
    t.boolean "privacy"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "email_logs", "tiers"
  add_foreign_key "email_logs", "users"
end
