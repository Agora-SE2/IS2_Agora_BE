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

ActiveRecord::Schema.define(version: 20180417204322) do

  create_table "featured_projects", force: :cascade do |t|
    t.integer  "year"
    t.integer  "week"
    t.integer  "day"
    t.integer  "law_project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "route"
    t.integer  "law_project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "law_projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.date     "publication_date"
    t.integer  "yes_votes"
    t.integer  "not_votes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "models", force: :cascade do |t|
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
    t.index ["email"], name: "index_models_on_email", unique: true
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true
  end

  create_table "opinions", force: :cascade do |t|
    t.string   "content"
    t.date     "date"
    t.integer  "like"
    t.boolean  "pro"
    t.integer  "law_project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "project_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "law_project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["law_project_id"], name: "index_project_tags_on_law_project_id"
    t.index ["tag_id"], name: "index_project_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.string   "icon_route"
    t.integer  "law_project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "authentication_token",   limit: 30
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "birth_name"
    t.string   "user_name"
    t.string   "description"
    t.boolean  "is_admin",                          default: false
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
