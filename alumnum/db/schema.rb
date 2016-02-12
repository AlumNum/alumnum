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

ActiveRecord::Schema.define(version: 20160212031154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "response"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.integer  "profile_id"
  end

  add_index "answers", ["profile_id"], name: "index_answers_on_profile_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "headline"
    t.string   "image_url"
    t.text     "bio"
    t.integer  "view_count"
    t.string   "status"
    t.string   "twitter"
    t.string   "github"
    t.string   "peronal_site"
    t.string   "linkedin"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "qnas", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.text     "response"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "qnas", ["question_id"], name: "index_qnas_on_question_id", using: :btree
  add_index "qnas", ["user_id"], name: "index_qnas_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resume_items", force: :cascade do |t|
    t.string   "title"
    t.string   "heading"
    t.string   "start_date"
    t.string   "end_date"
    t.text     "description"
    t.string   "kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "resume_items", ["user_id"], name: "index_resume_items_on_user_id", using: :btree

  create_table "saved_searches", force: :cascade do |t|
    t.string   "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taglists", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "skill_tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usertags", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "usertags", ["tag_id"], name: "index_usertags_on_tag_id", using: :btree
  add_index "usertags", ["user_id"], name: "index_usertags_on_user_id", using: :btree

  add_foreign_key "answers", "profiles"
  add_foreign_key "answers", "questions"
  add_foreign_key "profiles", "users"
  add_foreign_key "qnas", "questions"
  add_foreign_key "qnas", "users"
  add_foreign_key "resume_items", "users"
  add_foreign_key "usertags", "tags"
end
