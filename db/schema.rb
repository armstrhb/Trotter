# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160417030213) do

  create_table "activities", force: :cascade do |t|
    t.string   "name",                       null: false
    t.boolean  "is_quality", default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "eat_qualities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeling_reasons", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feelings", force: :cascade do |t|
    t.string   "name",                       null: false
    t.boolean  "positive",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "noise_level_descriptions", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nick_name"
    t.date     "birthday"
    t.string   "relationship_description"
    t.text     "notes"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "people_report_instances", id: false, force: :cascade do |t|
    t.integer "report_instance_id"
    t.integer "person_id"
  end

  add_index "people_report_instances", ["person_id"], name: "index_people_report_instances_on_person_id"
  add_index "people_report_instances", ["report_instance_id"], name: "index_people_report_instances_on_report_instance_id"

  create_table "report_daily_mornings", force: :cascade do |t|
    t.datetime "report_datetime",                        null: false
    t.float    "latitude"
    t.float    "longitude"
    t.float    "noise_level"
    t.integer  "sleep_quality_id"
    t.integer  "weather_id"
    t.float    "sleep_duration"
    t.integer  "number_drinks",              default: 0
    t.integer  "number_photos_added",        default: 0
    t.integer  "noise_level_description_id"
    t.integer  "number_steps_taken",         default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "report_daily_nights", force: :cascade do |t|
    t.datetime "report_datetime",                 null: false
    t.float    "latitude"
    t.float    "longitude"
    t.float    "noise_level"
    t.text     "what_learned"
    t.integer  "number_coffees",  default: 0
    t.integer  "eat_quality_id"
    t.integer  "weather_id"
    t.boolean  "exercised",       default: false
    t.boolean  "had_boys",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "report_instances", force: :cascade do |t|
    t.datetime "report_datetime",                            null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "number_photos_added",        default: 0
    t.float    "noise_level"
    t.integer  "number_steps_taken",         default: 0
    t.boolean  "is_working",                 default: false
    t.integer  "activity_id"
    t.integer  "location_id"
    t.integer  "feeling_id"
    t.integer  "feeling_reason_id"
    t.integer  "weather_id"
    t.integer  "noise_level_description_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "sleep_qualities", force: :cascade do |t|
    t.string   "name",       default: "f"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
