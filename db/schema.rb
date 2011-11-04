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

ActiveRecord::Schema.define(:version => 20111104122309) do

  create_table "accounts", :id => false, :force => true do |t|
    t.string   "account_id",      :limit => 36, :null => false
    t.string   "username",        :limit => 50, :null => false
    t.string   "password",        :limit => 32, :null => false
    t.boolean  "sex"
    t.string   "email",           :limit => 50, :null => false
    t.integer  "account_level",                 :null => false
    t.integer  "account_state",                 :null => false
    t.date     "birthdate"
    t.integer  "login_count",                   :null => false
    t.datetime "unban_time"
    t.datetime "expiration_time"
    t.datetime "last_login"
    t.string   "last_ip",         :limit => 15
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spot_id"
  end

  create_table "profiles", :id => false, :force => true do |t|
    t.string   "account_id", :limit => 36, :null => false
    t.string   "first_name", :limit => 40
    t.string   "last_name",  :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spots", :id => false, :force => true do |t|
    t.string   "spot_id",    :limit => 36, :null => false
    t.string   "owner_id",   :limit => 36, :null => false
    t.string   "local",      :limit => 40, :null => false
    t.datetime "start_time",               :null => false
    t.datetime "end_time",                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
