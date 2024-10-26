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

ActiveRecord::Schema.define(version: 2024_10_26_015048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "deposits", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "quantity", null: false
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.uuid "identifier", default: -> { "gen_random_uuid()" }, null: false
    t.integer "status", default: 0, null: false
    t.datetime "order_prepared_at"
    t.bigint "deposit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deposit_id"], name: "index_orders_on_deposit_id"
    t.index ["identifier"], name: "index_orders_on_identifier", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "identifier", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["identifier"], name: "index_products_on_identifier", unique: true
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "quantity", default: 0, null: false
    t.bigint "deposit_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deposit_id"], name: "index_stocks_on_deposit_id"
    t.index ["product_id"], name: "index_stocks_on_product_id"
  end

  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "deposits"
  add_foreign_key "stocks", "deposits"
  add_foreign_key "stocks", "products"
end
