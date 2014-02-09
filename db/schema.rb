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

ActiveRecord::Schema.define(version: 20140209131139) do

  create_table "achievments", force: true do |t|
    t.boolean  "completed"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "referee_email"
  end

  create_table "exercise_goals", force: true do |t|
    t.string   "goal_str"
    t.datetime "goal_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: true do |t|
    t.string   "goal_type"
    t.integer  "link_id"
    t.integer  "achievment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stakes", force: true do |t|
    t.integer  "achievment_id"
    t.string   "stake_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "link_id"
  end

  create_table "users", force: true do |t|
    t.string   "fb_id"
    t.string   "fb_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wake_up_goals", force: true do |t|
    t.string   "goal_str"
    t.date     "goal_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wall_post_stakes", force: true do |t|
    t.string   "stake_str"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stake_id"
  end

end
