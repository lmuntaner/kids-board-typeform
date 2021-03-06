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

ActiveRecord::Schema.define(version: 20150725190602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dashboard_integrations", force: :cascade do |t|
    t.integer  "dashboard_id"
    t.string   "label"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "integration_id"
  end

  create_table "dashboards", force: :cascade do |t|
    t.string   "dashboard_url"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "email_integrations", force: :cascade do |t|
    t.string   "label"
    t.string   "email"
    t.string   "body"
    t.integer  "dashboard_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "integrations", force: :cascade do |t|
    t.integer  "field_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "integration_url"
    t.string   "name"
  end

  create_table "selected_integrations", force: :cascade do |t|
    t.integer  "dashboard_id"
    t.string   "label"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  create_table "setup_forms", force: :cascade do |t|
    t.string   "form_url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password"
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
