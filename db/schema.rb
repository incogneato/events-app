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

ActiveRecord::Schema.define(version: 2018_05_21_142908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_brands", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_markets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_types", force: :cascade do |t|
    t.integer "event_id"
    t.integer "event_brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "weekend_name"
    t.string "year"
    t.date "adjusted_start"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.integer "event_market_id"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "venue_name"
    t.string "address"
    t.string "address_two"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "event_brand_id"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
