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

ActiveRecord::Schema.define(:version => 20111218145123) do

  create_table "courses", :id => false, :force => true do |t|
    t.string   "course_id",  :limit => 36,  :null => false
    t.string   "faculty_id", :limit => 36,  :null => false
    t.string   "name",       :limit => 100, :null => false
    t.string   "acronym",    :limit => 10,  :null => false
    t.integer  "degree",                    :null => false
    t.string   "begin",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplines", :id => false, :force => true do |t|
    t.string   "discipline_id", :limit => 36,  :null => false
    t.string   "code",          :limit => 7,   :null => false
    t.string   "name",          :limit => 100, :null => false
    t.string   "acronym",       :limit => 10,  :null => false
    t.string   "course_id",     :limit => 36,  :null => false
    t.integer  "semester",                     :null => false
    t.integer  "year",                         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculties", :id => false, :force => true do |t|
    t.string   "faculty_id",   :limit => 36,  :null => false
    t.string   "name",         :limit => 100, :null => false
    t.string   "acronym",      :limit => 10,  :null => false
    t.boolean  "faculty_type",                :null => false
    t.string   "url",          :limit => 100, :null => false
    t.string   "address",      :limit => 150
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :id => false, :force => true do |t|
    t.string   "profile_id", :limit => 36,  :null => false
    t.integer  "user_id",                   :null => false
    t.string   "first_name", :limit => 50,  :null => false
    t.string   "last_name",  :limit => 50,  :null => false
    t.string   "faculty_id", :limit => 36,  :null => false
    t.string   "course_id",  :limit => 36,  :null => false
    t.integer  "year",                      :null => false
    t.string   "language",   :limit => 2,   :null => false
    t.string   "local",      :limit => 150
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spots", :id => false, :force => true do |t|
    t.string   "spot_id",       :limit => 36, :null => false
    t.string   "discipline_id", :limit => 36, :null => false
    t.string   "user_id",                     :null => false
    t.string   "name",                        :null => false
    t.string   "local",         :limit => 50, :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_disciplines", :id => false, :force => true do |t|
    t.string   "user_disciplines_id", :limit => 36, :null => false
    t.string   "discipline_id",       :limit => 36, :null => false
    t.integer  "user_id",             :limit => 7,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_spots", :id => false, :force => true do |t|
    t.string   "user_spots_id", :limit => 36, :null => false
    t.string   "spot_id",       :limit => 36, :null => false
    t.integer  "user_id",       :limit => 7,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                               :default => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "wall_disciplines", :id => false, :force => true do |t|
    t.string   "wall_disciplines_id", :limit => 36, :null => false
    t.string   "discipline_id",       :limit => 36, :null => false
    t.integer  "user_id",             :limit => 7,  :null => false
    t.string   "comment",                           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wall_spots", :id => false, :force => true do |t|
    t.string   "wall_spots_id", :limit => 36, :null => false
    t.string   "spot_id",       :limit => 36, :null => false
    t.integer  "user_id",       :limit => 7,  :null => false
    t.string   "comment",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
