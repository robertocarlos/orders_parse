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

ActiveRecord::Schema.define(version: 20150212104503) do

  create_table "orders", force: :cascade do |t|
    t.string   "buyer"
    t.string   "description"
    t.float    "unit_price"
    t.float    "total_price"
    t.integer  "quantity"
    t.string   "address"
    t.string   "supplier"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orders", ["buyer"], name: "index_orders_on_buyer"
  add_index "orders", ["supplier"], name: "index_orders_on_supplier"
  add_index "orders", ["total_price"], name: "index_orders_on_total_price"

end
