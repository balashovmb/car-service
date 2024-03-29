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

ActiveRecord::Schema.define(version: 2022_07_14_080216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "executors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_positions", force: :cascade do |t|
    t.bigint "executor_id", null: false
    t.bigint "service_unit_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["executor_id"], name: "index_order_positions_on_executor_id"
    t.index ["order_id"], name: "index_order_positions_on_order_id"
    t.index ["service_unit_id"], name: "index_order_positions_on_service_unit_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_units", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "service_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_category_id"], name: "index_service_units_on_service_category_id"
  end

  add_foreign_key "order_positions", "executors"
  add_foreign_key "order_positions", "orders"
  add_foreign_key "order_positions", "service_units"
end
