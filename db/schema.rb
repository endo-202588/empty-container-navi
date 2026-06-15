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

ActiveRecord::Schema[8.1].define(version: 2026_06_15_073623) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "booking_number", null: false
    t.text "cargo_detail"
    t.string "cargo_name", null: false
    t.integer "container_type", null: false
    t.datetime "created_at", null: false
    t.integer "quantity", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "voyage_id", null: false
    t.index ["booking_number"], name: "index_bookings_on_booking_number", unique: true
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["voyage_id"], name: "index_bookings_on_voyage_id"
  end

  create_table "carriers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "container_stocks", force: :cascade do |t|
    t.bigint "carrier_id", null: false
    t.integer "container_type", null: false
    t.datetime "created_at", null: false
    t.bigint "port_id", null: false
    t.integer "quantity", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_container_stocks_on_carrier_id"
    t.index ["port_id"], name: "index_container_stocks_on_port_id"
  end

  create_table "ports", force: :cascade do |t|
    t.string "country", default: "JP", null: false
    t.datetime "created_at", null: false
    t.decimal "map_x"
    t.decimal "map_y"
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "arrival_port_id", null: false
    t.datetime "created_at", null: false
    t.bigint "departure_port_id", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_port_id"], name: "index_routes_on_arrival_port_id"
    t.index ["departure_port_id", "arrival_port_id"], name: "index_routes_on_departure_port_id_and_arrival_port_id", unique: true
    t.index ["departure_port_id"], name: "index_routes_on_departure_port_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "company_name", null: false
    t.datetime "created_at", null: false
    t.string "crypted_password"
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "role", default: 2, null: false
    t.string "salt"
    t.datetime "updated_at", null: false
    t.index "lower((email)::text)", name: "index_users_on_lower_email", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "voyages", force: :cascade do |t|
    t.bigint "carrier_id", null: false
    t.datetime "created_at", null: false
    t.date "departure_date", null: false
    t.integer "dry_capacity", default: 0, null: false
    t.integer "reefer_capacity", default: 0, null: false
    t.bigint "route_id", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_voyages_on_carrier_id"
    t.index ["route_id", "departure_date"], name: "index_voyages_on_route_id_and_departure_date", unique: true
    t.index ["route_id"], name: "index_voyages_on_route_id"
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "voyages"
  add_foreign_key "container_stocks", "carriers"
  add_foreign_key "container_stocks", "ports"
  add_foreign_key "routes", "ports", column: "arrival_port_id"
  add_foreign_key "routes", "ports", column: "departure_port_id"
  add_foreign_key "voyages", "carriers"
  add_foreign_key "voyages", "routes"
end
