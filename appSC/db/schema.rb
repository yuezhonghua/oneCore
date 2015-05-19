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

ActiveRecord::Schema.define(version: 20150512045243) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter",  limit: 255
    t.text     "body",       limit: 65535
    t.integer  "article_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "daily_err_code_ins_infos", force: :cascade do |t|
    t.string   "date",       limit: 255
    t.string   "app_type",   limit: 255
    t.string   "err_code",   limit: 255
    t.string   "acq_ins",    limit: 255
    t.string   "fwd_ins",    limit: 255
    t.decimal  "err_num",                precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "daily_err_codes", force: :cascade do |t|
    t.string   "date",       limit: 255
    t.string   "app_type",   limit: 255
    t.string   "err_code",   limit: 255
    t.decimal  "err_num",                precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "daily_err_codes", ["date", "app_type", "err_code"], name: "index_daily_err_codes_on_date_and_app_type_and_err_code", using: :btree

  create_table "daily_err_num_hours", force: :cascade do |t|
    t.string   "date",       limit: 255
    t.string   "app_type",   limit: 255
    t.string   "hour",       limit: 255
    t.decimal  "err_num",                precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "daily_err_num_hours", ["date", "app_type", "hour"], name: "index_daily_err_num_hours_on_date_and_app_type_and_hour", using: :btree

  create_table "daily_err_num_modules", force: :cascade do |t|
    t.string   "date",       limit: 255
    t.string   "app_type",   limit: 255
    t.string   "module",     limit: 255
    t.decimal  "err_num",                precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "daily_err_num_modules", ["date", "app_type", "module"], name: "index_daily_err_num_modules_on_date_and_app_type_and_module", using: :btree

  create_table "daily_err_nums", force: :cascade do |t|
    t.string   "date",       limit: 255
    t.string   "app_type",   limit: 255
    t.string   "host_name",  limit: 255
    t.decimal  "err_num",                precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "daily_err_nums", ["date", "app_type", "host_name"], name: "index_daily_err_nums_on_date_and_app_type_and_host_name", using: :btree

  create_table "err_codes", force: :cascade do |t|
    t.string   "err_code",    limit: 255
    t.string   "module_name", limit: 255
    t.string   "desc",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "err_codes", ["err_code", "module_name"], name: "index_err_codes_on_err_code_and_module_name", using: :btree

  create_table "sts", force: :cascade do |t|
    t.text     "daystr",     limit: 65535
    t.decimal  "daynum",                   precision: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "swts", force: :cascade do |t|
    t.text     "daystr",     limit: 65535
    t.decimal  "daynum",                   precision: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

end
