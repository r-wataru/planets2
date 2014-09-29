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

ActiveRecord::Schema.define(version: 20140929070036) do

  create_table "emails", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "address",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emails", ["address"], name: "index_emails_on_address", unique: true, using: :btree

  create_table "user_images", force: true do |t|
    t.integer  "user_id",       null: false
    t.binary   "data1"
    t.string   "content_type1"
    t.binary   "data2"
    t.string   "content_type2"
    t.binary   "data3"
    t.string   "content_type3"
    t.binary   "data4"
    t.string   "content_type4"
    t.binary   "data5"
    t.string   "content_type5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_images", ["user_id"], name: "index_user_images_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "number"
    t.string   "display_name"
    t.string   "screen_name"
    t.date     "birthday"
    t.integer  "age"
    t.datetime "logged_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
