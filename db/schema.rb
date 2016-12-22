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

ActiveRecord::Schema.define(version: 20161220043842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "event"
    t.string   "venue"
    t.string   "date"
    t.string   "time"
    t.string   "description"
    t.string   "invited"
    t.integer  "user_id"
    t.string   "invitee",     default: [],              array: true
    t.string   "status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.integer  "event_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "phone"
    t.string   "docter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "email"
    t.string   "phone"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "image"
  end

end
