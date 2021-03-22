# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_22_133513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "case_notes", force: :cascade do |t|
    t.text "content"
    t.bigint "case_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["case_id"], name: "index_case_notes_on_case_id"
  end

  create_table "cases", force: :cascade do |t|
    t.string "title"
    t.text "story_summary"
    t.text "story"
    t.date "start_date"
    t.date "end_date"
    t.integer "target_amount"
    t.string "transaction_reference"
    t.string "status"
    t.string "category"
    t.boolean "admin_approved", default: false
    t.bigint "worker_id", null: false
    t.bigint "coordinator_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coordinator_id"], name: "index_cases_on_coordinator_id"
    t.index ["user_id"], name: "index_cases_on_user_id"
    t.index ["worker_id"], name: "index_cases_on_worker_id"
  end

  create_table "coordinators", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "mobile_number"
    t.text "description"
    t.string "telegram_handle"
    t.boolean "is_archived", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transaction_notes", force: :cascade do |t|
    t.text "content"
    t.bigint "transaction_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transaction_id"], name: "index_transaction_notes_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_reference"
    t.string "payee_name"
    t.string "currency"
    t.integer "amount"
    t.text "comment"
    t.bigint "case_id", null: false
    t.string "status"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["case_id"], name: "index_transactions_on_case_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "mobile_number"
    t.string "telegram_handle"
    t.boolean "is_archived", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "worker_notes", force: :cascade do |t|
    t.text "content"
    t.bigint "worker_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["worker_id"], name: "index_worker_notes_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "alias"
    t.string "mobile_number"
    t.text "description"
    t.string "id_type"
    t.boolean "id_valid", default: false
    t.string "payment_link"
    t.boolean "is_archived", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "case_notes", "cases"
  add_foreign_key "cases", "coordinators"
  add_foreign_key "cases", "users"
  add_foreign_key "cases", "workers"
  add_foreign_key "transaction_notes", "transactions"
  add_foreign_key "transactions", "cases"
  add_foreign_key "worker_notes", "workers"
end
