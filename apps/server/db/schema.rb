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

ActiveRecord::Schema[8.0].define(version: 2025_07_10_014109) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "customer_orders", force: :cascade do |t|
    t.integer "status"
    t.bigint "estimated_delivery_date"
    t.string "payment_method"
    t.bigint "organization_id"
    t.bigint "customer_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.text "email"
    t.bigint "person_id"
    t.bigint "company_id"
    t.bigint "address_id"
    t.bigint "phone_number_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_lines", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "quantity"
    t.bigint "unit_price_cents"
    t.string "unit_price_currency"
    t.bigint "customer_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_value_adjustments", force: :cascade do |t|
    t.text "description"
    t.bigint "value_cents"
    t.string "value_currency"
    t.bigint "customer_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.text "name"
    t.text "cnpj"
    t.text "email"
    t.bigint "address_id"
    t.bigint "phone_number_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.bigint "default_unit_price_cents"
    t.string "default_unit_price_currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
