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

ActiveRecord::Schema.define(version: 2021_08_19_150359) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.integer "quantity"
    t.integer "goods_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.string "postal_code"
    t.string "address"
    t.string "telephone_number"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.integer "genre_id"
    t.integer "sales_status"
    t.string "name"
    t.string "image_id"
    t.text "introduction"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordered_goods", force: :cascade do |t|
    t.integer "goods_id", null: false
    t.integer "order_id", null: false
    t.integer "quantity", null: false
    t.integer "price", null: false
    t.integer "production_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "shipping_postal_code"
    t.string "shipping_address"
    t.string "shipping_name"
    t.integer "shipping_fee"
    t.integer "total_price"
    t.integer "payment_method"
    t.integer "order_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "shipping_postal_code", default: "", null: false
    t.text "shipping_address", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
  end

end
