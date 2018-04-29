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

ActiveRecord::Schema.define(version: 20180429092451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "visa_or_ticket"
    t.string   "bye_or_sell"
    t.integer  "amount"
    t.integer  "quantity"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "paidAmount"
    t.integer  "creditAmount"
    t.integer  "debitAmount"
    t.integer  "actualCost"
    t.integer  "salePrice"
    t.integer  "profit"
    t.string   "status"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_companies_on_user_id", using: :btree
  end

  create_table "deals", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_deals_on_user_id", using: :btree
  end

  create_table "expenses", force: :cascade do |t|
    t.integer  "employees_salray"
    t.integer  "ptcl_bill"
    t.integer  "electricity_bill"
    t.integer  "office_rent"
    t.integer  "motorcycle_petrol"
    t.integer  "car_petrol"
    t.integer  "office_lunch"
    t.integer  "guests_entertainment"
    t.integer  "office_stationary"
    t.integer  "office_renovation"
    t.integer  "cable_fee"
    t.integer  "office_licenses_maintenance"
    t.string   "fbr_returns"
    t.string   "other_expenses_detail"
    t.integer  "other_expenses"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_expenses_on_user_id", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.string   "airline"
    t.string   "sector"
    t.integer  "sale_price"
    t.integer  "actual_price"
    t.string   "ticket_no"
    t.string   "airline_pnr"
    t.string   "gds_pnr"
    t.string   "from"
    t.string   "to"
    t.integer  "adult"
    t.integer  "child"
    t.integer  "infant"
    t.integer  "quantity"
    t.integer  "creditAmount"
    t.integer  "debit"
    t.integer  "margin"
    t.string   "status"
    t.text     "description"
    t.integer  "paidAmount"
    t.string   "phone"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "visas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.string   "visaWith"
    t.string   "countryCode"
    t.integer  "paidAmount"
    t.integer  "creditAmount"
    t.integer  "debitAmount"
    t.integer  "actualCost"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "salePrice"
    t.integer  "profit"
    t.string   "status"
    t.string   "name"
    t.text     "description"
    t.string   "visaType"
    t.string   "days"
    t.string   "phone"
    t.integer  "quantity"
    t.integer  "adult"
    t.integer  "child"
    t.integer  "infant"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_visits_on_user_id", using: :btree
  end

end
