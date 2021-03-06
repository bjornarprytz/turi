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

ActiveRecord::Schema.define(version: 20150303144524) do

  create_table "equipment_lists", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "icon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "trip_id"
  end

  add_index "equipment_lists", ["trip_id"], name: "index_equipment_lists_on_trip_id"

  create_table "participant_roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participant_roles", ["name"], name: "index_participant_roles_on_name", unique: true

  create_table "participants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "participant_role_id"
  end

  add_index "participants", ["participant_role_id"], name: "index_participants_on_participant_role_id"
  add_index "participants", ["trip_id"], name: "index_participants_on_trip_id"
  add_index "participants", ["user_id", "trip_id"], name: "index_participants_on_user_id_and_trip_id", unique: true
  add_index "participants", ["user_id"], name: "index_participants_on_user_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "trips", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.text     "start_loc"
    t.text     "end_loc"
    t.text     "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "start_date"
    t.text     "end_date"
    t.integer  "user_id"
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                                null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "town"
    t.integer  "age"
    t.string   "status"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
