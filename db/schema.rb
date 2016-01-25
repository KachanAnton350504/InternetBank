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

ActiveRecord::Schema.define(version: 20160125170138) do

  create_table "client_messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "client_messages", ["client_id"], name: "index_client_messages_on_client_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "oauth_token"
    t.string   "uid"
    t.integer  "role"
    t.integer  "bill_rus",         default: 0
    t.integer  "bill_bel",         default: 0
    t.integer  "bill_euro",        default: 0
    t.integer  "bill_dollars",     default: 0
    t.datetime "oauth_expires_at"
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "kind_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deposers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deposit_departments", force: :cascade do |t|
    t.integer  "all_deposit_profit"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "deposit_queries", force: :cascade do |t|
    t.integer  "sum"
    t.integer  "deposit_type_id"
    t.integer  "client_id"
    t.integer  "deposer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "deposit_queries", ["client_id"], name: "index_deposit_queries_on_client_id"
  add_index "deposit_queries", ["deposer_id"], name: "index_deposit_queries_on_deposer_id"
  add_index "deposit_queries", ["deposit_type_id"], name: "index_deposit_queries_on_deposit_type_id"

  create_table "deposit_types", force: :cascade do |t|
    t.string   "kind"
    t.integer  "percent"
    t.integer  "min_sum"
    t.integer  "currency_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "deposit_duration"
    t.string   "currency"
  end

  create_table "deposits", force: :cascade do |t|
    t.datetime "data_begin"
    t.integer  "sum"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "client_id"
    t.integer  "deposit_type_id"
  end

  add_index "deposits", ["client_id"], name: "index_deposits_on_client_id"
  add_index "deposits", ["deposit_type_id"], name: "index_deposits_on_deposit_type_id"

  create_table "exchange_currencies", force: :cascade do |t|
    t.string   "currency_form"
    t.string   "currency_to"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "money", force: :cascade do |t|
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "the_banks", force: :cascade do |t|
    t.string   "name"
    t.integer  "rating"
    t.integer  "start_capital"
    t.integer  "money_total"
    t.integer  "money_on_credits"
    t.integer  "money_on_deposits"
    t.integer  "money_dollars"
    t.integer  "money_bel"
    t.integer  "money_rus"
    t.integer  "money_euro"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
