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

ActiveRecord::Schema.define(version: 20150829171950) do

  create_table "albums", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "r_photo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "picture"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "c_content"
    t.integer  "c_like",                 default: 0
    t.integer  "c_facebook_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "c_restaurant_id"
    t.integer  "restaurant_id"
    t.string   "facebook_user_nickname"
    t.integer  "facebook_user_id"
  end

  create_table "facebook_users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "nickname"
    t.boolean  "admin",            default: false
    t.boolean  "recommend",        default: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "r_name"
    t.string   "r_phone_number"
    t.integer  "r_click_count",   default: 0
    t.integer  "r_like",          default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "r_distance"
    t.string   "r_time"
    t.string   "r_code"
    t.float    "r_latitude"
    t.float    "r_longtitude"
    t.string   "r_distance_door"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remeber_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "valuations", force: :cascade do |t|
    t.integer  "facebook_user_id"
    t.integer  "restaurant_id"
    t.boolean  "recommend"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
