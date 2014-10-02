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

ActiveRecord::Schema.define(version: 20140930080546) do

  create_table "administrators", force: true do |t|
    t.string   "login_name",                      null: false
    t.string   "password_digest",                 null: false
    t.boolean  "super_user",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "address",    null: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emails", ["address"], name: "index_emails_on_address", unique: true, using: :btree

  create_table "games", force: true do |t|
    t.integer  "season_id",                     null: false
    t.string   "name",                          null: false
    t.text     "description"
    t.datetime "played_at",                     null: false
    t.string   "total_result",                  null: false
    t.text     "result1"
    t.text     "result2"
    t.integer  "plate_appearances", default: 0, null: false
    t.integer  "at_bats",           default: 0, null: false
    t.integer  "single",            default: 0, null: false
    t.integer  "double",            default: 0, null: false
    t.integer  "triple",            default: 0, null: false
    t.integer  "home_run",          default: 0, null: false
    t.integer  "base_on_balls",     default: 0, null: false
    t.integer  "hit_by_pitches",    default: 0, null: false
    t.integer  "sacrifice_bunts",   default: 0, null: false
    t.integer  "sacrifice_flies",   default: 0, null: false
    t.integer  "gaffe",             default: 0, null: false
    t.integer  "infield_grounder",  default: 0, null: false
    t.integer  "outfield_grounder", default: 0, null: false
    t.integer  "infield_fly",       default: 0, null: false
    t.integer  "outfield_fly",      default: 0, null: false
    t.integer  "infield_linera",    default: 0, null: false
    t.integer  "out_linera",        default: 0, null: false
    t.integer  "strikeouts",        default: 0, null: false
    t.integer  "runs_batted_in",    default: 0, null: false
    t.integer  "runs_scored",       default: 0, null: false
    t.integer  "stolen_bases",      default: 0, null: false
    t.integer  "pitching_number",   default: 0, null: false
    t.integer  "hit",               default: 0, null: false
    t.integer  "run",               default: 0
    t.integer  "get_strikeouts",    default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["season_id"], name: "index_games_on_season_id", using: :btree

  create_table "individual_competences", force: true do |t|
    t.integer  "user_id",                         null: false
    t.boolean  "pitcher",         default: false, null: false
    t.boolean  "catcher",         default: false, null: false
    t.boolean  "first",           default: false, null: false
    t.boolean  "second",          default: false, null: false
    t.boolean  "short",           default: false, null: false
    t.boolean  "third",           default: false, null: false
    t.boolean  "outfield",        default: false, null: false
    t.integer  "line",            default: 0,     null: false
    t.integer  "meet",            default: 0,     null: false
    t.integer  "power",           default: 0,     null: false
    t.integer  "running_ability", default: 0,     null: false
    t.integer  "shoulder_power",  default: 0,     null: false
    t.integer  "defense",         default: 0,     null: false
    t.integer  "speed",           default: 0,     null: false
    t.integer  "controll",        default: 0,     null: false
    t.integer  "stamina",         default: 0,     null: false
    t.integer  "throw",           default: 0,     null: false
    t.integer  "swing",           default: 0,     null: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "individual_competences", ["user_id"], name: "index_individual_competences_on_user_id", using: :btree

  create_table "individual_results", force: true do |t|
    t.integer  "user_id",                       null: false
    t.integer  "game_id",                       null: false
    t.integer  "plate_appearances", default: 0, null: false
    t.integer  "at_bats",           default: 0, null: false
    t.integer  "single",            default: 0, null: false
    t.integer  "double",            default: 0, null: false
    t.integer  "triple",            default: 0, null: false
    t.integer  "home_run",          default: 0, null: false
    t.integer  "base_on_balls",     default: 0, null: false
    t.integer  "hit_by_pitches",    default: 0, null: false
    t.integer  "sacrifice_bunts",   default: 0, null: false
    t.integer  "sacrifice_flies",   default: 0, null: false
    t.integer  "gaffe",             default: 0, null: false
    t.integer  "infield_grounder",  default: 0, null: false
    t.integer  "outfield_grounder", default: 0, null: false
    t.integer  "infield_fly",       default: 0, null: false
    t.integer  "outfield_fly",      default: 0, null: false
    t.integer  "infield_linera",    default: 0, null: false
    t.integer  "out_linera",        default: 0, null: false
    t.integer  "strikeouts",        default: 0, null: false
    t.integer  "runs_batted_in",    default: 0, null: false
    t.integer  "runs_scored",       default: 0, null: false
    t.integer  "stolen_bases",      default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "individual_results", ["user_id"], name: "index_individual_results_on_user_id", using: :btree

  create_table "individual_total_results", force: true do |t|
    t.integer  "user_id",                          null: false
    t.integer  "season_id",                        null: false
    t.integer  "plate_appearances",   default: 0,  null: false
    t.integer  "at_bats",             default: 0,  null: false
    t.integer  "single",              default: 0,  null: false
    t.integer  "double",              default: 0,  null: false
    t.integer  "triple",              default: 0,  null: false
    t.integer  "home_run",            default: 0,  null: false
    t.integer  "base_on_balls",       default: 0,  null: false
    t.integer  "hit_by_pitches",      default: 0,  null: false
    t.integer  "sacrifice_bunts",     default: 0,  null: false
    t.integer  "sacrifice_flies",     default: 0,  null: false
    t.integer  "gaffe",               default: 0,  null: false
    t.integer  "infield_grounder",    default: 0,  null: false
    t.integer  "outfield_grounder",   default: 0,  null: false
    t.integer  "infield_fly",         default: 0,  null: false
    t.integer  "outfield_fly",        default: 0,  null: false
    t.integer  "infield_linera",      default: 0,  null: false
    t.integer  "out_linera",          default: 0,  null: false
    t.integer  "strikeouts",          default: 0,  null: false
    t.integer  "runs_batted_in",      default: 0,  null: false
    t.integer  "runs_scored",         default: 0,  null: false
    t.integer  "stolen_bases",        default: 0,  null: false
    t.text     "set_games"
    t.string   "batting_average",     default: "", null: false
    t.string   "base_percentage",     default: "", null: false
    t.string   "slugging_percentage", default: "", null: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "individual_total_results", ["user_id"], name: "index_individual_total_results_on_user_id", using: :btree

  create_table "pitcher_results", force: true do |t|
    t.integer  "user_id",                     null: false
    t.integer  "game_id",                     null: false
    t.integer  "pitching_number", default: 0, null: false
    t.integer  "hit",             default: 0, null: false
    t.integer  "run",             default: 0, null: false
    t.integer  "remorse_point",   default: 0, null: false
    t.integer  "strikeouts",      default: 0, null: false
    t.integer  "winning",         default: 0, null: false
    t.integer  "defeat",          default: 0, null: false
    t.integer  "hold_number",     default: 0, null: false
    t.integer  "save_number",     default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pitcher_results", ["user_id"], name: "index_pitcher_results_on_user_id", using: :btree

  create_table "pitcher_total_results", force: true do |t|
    t.integer  "user_id",                     null: false
    t.integer  "season_id",                   null: false
    t.integer  "pitching_number", default: 0, null: false
    t.integer  "hit",             default: 0, null: false
    t.integer  "run",             default: 0, null: false
    t.integer  "remorse_point",   default: 0, null: false
    t.integer  "strikeouts",      default: 0, null: false
    t.integer  "winning",         default: 0, null: false
    t.integer  "defeat",          default: 0, null: false
    t.integer  "hold_number",     default: 0, null: false
    t.integer  "save_number",     default: 0, null: false
    t.text     "set_games"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pitcher_total_results", ["user_id"], name: "index_pitcher_total_results_on_user_id", using: :btree

  create_table "seasons", force: true do |t|
    t.integer  "year",                       null: false
    t.string   "name",                       null: false
    t.boolean  "use",        default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seasons", ["year"], name: "index_seasons_on_year", unique: true, using: :btree

  create_table "user_identities", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.string   "info",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_identities", ["provider", "uid", "info"], name: "index_user_identities_on_provider_and_uid_and_info", unique: true, using: :btree

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
    t.date     "birthday"
    t.integer  "age"
    t.datetime "logged_at"
    t.text     "description"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["number"], name: "index_users_on_number", unique: true, using: :btree

end
