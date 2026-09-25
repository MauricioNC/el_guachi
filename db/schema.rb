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

ActiveRecord::Schema[8.1].define(version: 2026_09_25_060541) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "access_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "event_type", null: false
    t.datetime "occurred_at", null: false
    t.bigint "reservations_id", null: false
    t.integer "source", null: false
    t.datetime "updated_at", null: false
    t.bigint "venue_id", null: false
    t.index ["reservations_id"], name: "index_access_events_on_reservations_id"
    t.index ["venue_id"], name: "index_access_events_on_venue_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "ends_at"
    t.string "name", null: false
    t.string "qr_token", default: -> { "md5((random())::text)" }, null: false
    t.integer "reserved_count", null: false
    t.datetime "starts_at"
    t.integer "status", default: 0, null: false
    t.bigint "table_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "venue_id", null: false
    t.index ["table_id"], name: "index_reservations_on_table_id"
    t.index ["venue_id"], name: "index_reservations_on_venue_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "capacity", null: false
    t.datetime "created_at", null: false
    t.integer "number", null: false
    t.datetime "updated_at", null: false
    t.bigint "venue_id", null: false
    t.index ["venue_id"], name: "index_tables_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.integer "capacity", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.integer "reentry_reserved", default: 0, null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "access_events", "reservations", column: "reservations_id"
  add_foreign_key "access_events", "venues"
  add_foreign_key "reservations", "tables"
  add_foreign_key "reservations", "venues"
  add_foreign_key "tables", "venues"
end
