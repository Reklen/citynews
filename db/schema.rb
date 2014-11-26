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

ActiveRecord::Schema.define(version: 20141126172740) do

  create_table "articles", force: true do |t|
    t.integer "user_id",                 null: false
    t.string  "title",                   null: false
    t.string  "description",             null: false
    t.integer "like",        default: 0
    t.integer "dislikes",    default: 0
  end

  create_table "events", force: true do |t|
    t.integer "user_id"
    t.date    "date",        null: false
    t.string  "title",       null: false
    t.text    "description", null: false
    t.string  "photo"
  end

  create_table "promotions", force: true do |t|
    t.integer "store_id"
    t.string  "title",                   null: false
    t.string  "description",             null: false
    t.integer "price",                   null: false
    t.string  "photo"
    t.integer "like",        default: 0
    t.integer "dislike",     default: 0
  end

  create_table "stores", force: true do |t|
    t.integer "user_id",      null: false
    t.string  "name",         null: false
    t.string  "address",      null: false
    t.string  "phone",        null: false
    t.string  "website"
    t.string  "picture_path"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
