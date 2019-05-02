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

ActiveRecord::Schema.define(version: 20190501045036) do

  create_table "accommodation_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "description"
    t.string   "label",       limit: 20, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "accommodations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "accommodation_type_id",                                     null: false
    t.integer  "building_id",                                               null: false
    t.boolean  "air_conditioning",                                          null: false
    t.boolean  "bathroom",                                                  null: false
    t.string   "description"
    t.boolean  "hold",                                                      null: false
    t.boolean  "kitchen",                                                   null: false
    t.string   "label",                 limit: 40,                          null: false
    t.integer  "occupancy",                                                 null: false
    t.decimal  "price",                            precision: 12, scale: 2, null: false
    t.integer  "quantity",                                                  null: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  create_table "building_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "description"
    t.string   "label",       limit: 20, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "buildings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "building_type_id",            null: false
    t.string   "description"
    t.string   "image"
    t.string   "label",            limit: 40, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "email_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email_type"
    t.integer  "user_id"
    t.integer  "tier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tier_id"], name: "index_email_logs_on_tier_id", using: :btree
    t.index ["user_id"], name: "index_email_logs_on_user_id", using: :btree
  end

  create_table "instants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "instant"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_instants_on_name", unique: true, using: :btree
  end

  create_table "payment_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "label",      limit: 20, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "planners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category",      limit: 40
    t.string   "title"
    t.text     "body",          limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "display_order",               default: 50
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "accommodation_id",                              null: false
    t.integer  "processed_by_user_id"
    t.integer  "user_id",                                       null: false
    t.datetime "paid_date"
    t.decimal  "price",                precision: 12, scale: 2, null: false
    t.integer  "quantity",                                      null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.decimal  "payment_amount",       precision: 12, scale: 2
    t.integer  "payment_types_id"
    t.index ["payment_types_id"], name: "index_reservations_on_payment_types_id", using: :btree
  end

  create_table "tiers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "label",       limit: 40,    null: false
    t.string   "description",               null: false
    t.datetime "available",                 null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "sent_date"
    t.text     "email_html",  limit: 65535
    t.text     "email_text",  limit: 65535
    t.string   "subject"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                limit: 60,                    null: false
    t.string   "email",                                             null: false
    t.boolean  "admin",                             default: false, null: false
    t.text     "notes",               limit: 65535
    t.string   "password_digest"
    t.string   "phone",               limit: 16,                    null: false
    t.boolean  "planner_found",                     default: false, null: false
    t.string   "role",                limit: 20,                    null: false
    t.integer  "tier_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "tier_approved_email"
    t.boolean  "privacy"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "email_logs", "tiers"
  add_foreign_key "email_logs", "users"
end
