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

ActiveRecord::Schema.define(version: 20170613100031) do

  create_table "article_categories", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "image",           limit: 255
    t.string   "seo_title",       limit: 255
    t.string   "seo_keywords",    limit: 255
    t.string   "seo_description", limit: 255
    t.integer  "parent_id",       limit: 4
    t.integer  "lft",             limit: 4
    t.integer  "rgt",             limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "lng",             limit: 255
    t.integer  "category_id",     limit: 4
    t.string   "title",           limit: 255
    t.string   "subtitle",        limit: 255
    t.text     "content",         limit: 65535
    t.string   "image",           limit: 255
    t.string   "seo_title",       limit: 255
    t.string   "seo_keywords",    limit: 255
    t.string   "seo_description", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "articles", ["category_id"], name: "index_articles_on_category_id", using: :btree
  add_index "articles", ["lng"], name: "index_articles_on_lng", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.boolean  "is_admin"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
