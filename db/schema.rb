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

ActiveRecord::Schema.define(version: 20160302091945) do

  create_table "agreements", force: :cascade do |t|
    t.integer  "code",           limit: 8
    t.date     "sign_date"
    t.date     "due_date"
    t.boolean  "easement",                 default: false
    t.boolean  "archived",                 default: false
    t.integer  "interest"
    t.text     "comment"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "tenant_id"
    t.integer  "rent_object_id"
  end

  add_index "agreements", ["rent_object_id"], name: "index_agreements_on_rent_object_id"
  add_index "agreements", ["tenant_id"], name: "index_agreements_on_tenant_id"

  create_table "agreements_sessions", id: false, force: :cascade do |t|
    t.integer "agreement_id", null: false
    t.integer "session_id",   null: false
  end

  create_table "extensions", force: :cascade do |t|
    t.integer  "code",         limit: 8
    t.date     "sign_date"
    t.date     "due_date"
    t.boolean  "archived",               default: false
    t.integer  "interest"
    t.text     "comment"
    t.integer  "category"
    t.integer  "agreement_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "extensions", ["agreement_id"], name: "index_extensions_on_agreement_id"

  create_table "extensions_sessions", id: false, force: :cascade do |t|
    t.integer "extension_id", null: false
    t.integer "session_id",   null: false
  end

  create_table "rent_objects", force: :cascade do |t|
    t.string   "code"
    t.decimal  "area"
    t.text     "function"
    t.text     "comment"
    t.string   "house_number"
    t.boolean  "rented",        default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "settlement_id"
    t.integer  "street_id"
  end

  add_index "rent_objects", ["settlement_id"], name: "index_rent_objects_on_settlement_id"
  add_index "rent_objects", ["street_id"], name: "index_rent_objects_on_street_id"

  create_table "sessions", force: :cascade do |t|
    t.date     "s_date"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settlements", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "streets", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.integer  "category"
    t.string   "name"
    t.integer  "code",          limit: 8
    t.string   "house_number"
    t.integer  "apt_number"
    t.text     "comment"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "settlement_id"
    t.integer  "street_id"
  end

  add_index "tenants", ["settlement_id"], name: "index_tenants_on_settlement_id"
  add_index "tenants", ["street_id"], name: "index_tenants_on_street_id"

  create_table "valuations", force: :cascade do |t|
    t.string   "code"
    t.date     "val_date"
    t.decimal  "value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "rent_object_id"
  end

  add_index "valuations", ["rent_object_id"], name: "index_valuations_on_rent_object_id"

end
