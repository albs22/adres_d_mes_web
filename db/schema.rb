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

ActiveRecord::Schema.define(version: 20141121043011) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "date"
    t.string   "location"
    t.float    "lat"
    t.float    "lng"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "violations", force: true do |t|
    t.datetime "date_entered"
    t.string   "type"
    t.string   "status"
    t.string   "description"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.float    "lat"
    t.string   "violation_type"
    t.string   "violation_address"
    t.string   "photo_name"
    t.string   "image_before_file_name"
    t.string   "image_before_content_type"
    t.integer  "image_before_file_size"
    t.datetime "image_before_updated_at"
    t.string   "image_after_file_name"
    t.string   "image_after_content_type"
    t.integer  "image_after_file_size"
    t.datetime "image_after_updated_at"
    t.float    "lng"
    t.boolean  "approved",                  default: false
    t.integer  "event_id"
    t.datetime "date_closed"
  end

end
