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

ActiveRecord::Schema.define(version: 2020_06_23_072229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "challenges", force: :cascade do |t|
    t.string "description"
    t.string "region"
    t.string "search_criteria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "corporate_id"
    t.bigint "user_id"
    t.boolean "published", default: false
    t.index ["corporate_id"], name: "index_challenges_on_corporate_id"
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "corporates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.string "job_title"
    t.string "company_name"
    t.string "company_description"
    t.string "company_usp"
    t.string "company_poc_description"
    t.string "company_poc_examples"
    t.string "company_industry"
    t.string "email"
    t.boolean "privacy"
    t.string "company_type"
  end

  create_table "proposals", force: :cascade do |t|
    t.bigint "challenge_id"
    t.bigint "startup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "usp"
    t.string "poc_description"
    t.string "poc_examples"
    t.boolean "match_criteria", default: false
    t.index ["challenge_id"], name: "index_proposals_on_challenge_id"
    t.index ["startup_id"], name: "index_proposals_on_startup_id"
  end

  create_table "startups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "keywords"
    t.string "location"
    t.string "valuation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "keyword"
    t.string "tags"
    t.string "industry"
    t.string "founding_year"
    t.string "funding"
    t.integer "employees"
    t.string "offering"
    t.string "usp"
    t.string "poc_description"
    t.string "poc_examples"
    t.boolean "match_criteria", default: false
    t.string "employee_name"
    t.string "employee_surname"
    t.string "employee_job_title"
    t.string "employee_email"
    t.boolean "privacy"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.string "job_title"
    t.string "company_name"
    t.string "company_description"
    t.string "company_usp"
    t.string "company_poc_description"
    t.string "company_poc_examples"
    t.string "company_industry"
    t.boolean "corporate", default: false
    t.boolean "startup", default: false
    t.string "e_mail"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "challenges", "corporates"
  add_foreign_key "challenges", "users"
  add_foreign_key "proposals", "challenges"
  add_foreign_key "proposals", "startups"
end
