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

ActiveRecord::Schema.define(version: 20160215190228) do

  create_table "agreements", force: :cascade do |t|
    t.integer  "code"
    t.date     "sign_date"
    t.date     "due_date"
    t.boolean  "archived"
    t.integer  "interest"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rent_objects", force: :cascade do |t|
    t.integer  "code"
    t.decimal  "area"
    t.text     "function"
    t.text     "comment"
    t.string   "house_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.date     "s_date"
    t.integer  "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "code"
    t.string   "house_number"
    t.integer  "apt_number"
    t.text     "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "valuations", force: :cascade do |t|
    t.integer  "code"
    t.date     "val_date"
    t.decimal  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
