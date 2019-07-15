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

ActiveRecord::Schema.define(version: 2019_07_14_122736) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "brand_category_id"
  end

  create_table "credit_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "card_number", default: "", null: false
    t.string "name", default: "", null: false
    t.string "valid_year", default: "", null: false
    t.string "valid_month", default: "", null: false
    t.string "security_code", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "detail", null: false
    t.integer "item_size_id", null: false
    t.integer "delivery_charge_id", null: false
    t.integer "prefecture_id", null: false
    t.integer "delivery_time_id", null: false
    t.integer "delivery_way_id", null: false
    t.integer "price", null: false
    t.integer "item_state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "large_category_id"
    t.bigint "middle_category_id"
    t.bigint "small_category_id"
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["large_category_id"], name: "index_items_on_large_category_id"
    t.index ["middle_category_id"], name: "index_items_on_middle_category_id"
    t.index ["small_category_id"], name: "index_items_on_small_category_id"
  end

  create_table "large_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "order_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "middle_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "order_number"
    t.bigint "large_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["large_category_id"], name: "index_middle_categories_on_large_category_id"
  end

  create_table "receiver_informations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "family_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "family_name_kana", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.integer "prefecture", default: 0, null: false
    t.string "city", default: "", null: false
    t.string "street", default: "", null: false
    t.string "building"
    t.string "phone_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_receiver_informations_on_user_id"
  end

  create_table "small_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "order_number"
    t.bigint "middle_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["middle_category_id"], name: "index_small_categories_on_middle_category_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.text "profile"
    t.string "icon"
    t.string "family_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "family_name_kana", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.integer "birth_year", default: 0, null: false
    t.integer "birth_month", default: 0, null: false
    t.integer "birth_day", default: 0, null: false
    t.string "phone_number", default: "", null: false
    t.string "postal_code"
    t.integer "prefecture"
    t.string "city"
    t.string "street"
    t.string "building"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "credit_cards", "users"
  add_foreign_key "images", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "large_categories"
  add_foreign_key "items", "middle_categories"
  add_foreign_key "items", "small_categories"
  add_foreign_key "middle_categories", "large_categories"
  add_foreign_key "receiver_informations", "users"
  add_foreign_key "small_categories", "middle_categories"
end
