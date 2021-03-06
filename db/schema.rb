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

ActiveRecord::Schema.define(version: 20160616163523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "raw_entries", force: :cascade do |t|
    t.date   "date",                null: false
    t.string "start",  default: "", null: false
    t.string "end",    default: "", null: false
    t.text   "things", default: "", null: false
    t.index ["date"], name: "index_raw_entries_on_date", using: :btree
  end

  create_table "time_entries", force: :cascade do |t|
    t.datetime "start_at",                   null: false
    t.datetime "end_at",                     null: false
    t.boolean  "exact",      default: false, null: false
    t.string   "pj_name",                    null: false
    t.string   "task_name",                  null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.date     "date",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
