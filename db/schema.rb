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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121105065640) do

  create_table "food_pictures", :force => true do |t|
    t.integer  "user_id"
    t.string   "file_name"
    t.integer  "meal_type"
    t.string   "store_name"
    t.string   "menu_name"
    t.integer  "star_num"
    t.text     "comment"
    t.integer  "amenity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friend_requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "requested_user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "group_relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.integer  "amenity"
    t.float    "max_parcentage"
    t.float    "min_parcentage"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "recommend_stores", :force => true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.integer  "average_star_num"
    t.string   "file_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "uiid"
    t.string   "name"
    t.string   "profile_image_file_name"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

end
