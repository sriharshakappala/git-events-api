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

ActiveRecord::Schema.define(version: 20180425183721) do

  create_table "actors", force: :cascade do |t|
    t.integer  "uuid",           limit: 8
    t.string   "login"
    t.string   "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "events_count"
    t.datetime "last_event_at"
    t.integer  "longest_streak",           default: 0
  end

  create_table "events", force: :cascade do |t|
    t.integer  "uuid",       limit: 8
    t.string   "event_type"
    t.integer  "actor_id"
    t.integer  "repo_id"
    t.datetime "occured_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repos", force: :cascade do |t|
    t.integer  "uuid",       limit: 8
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
