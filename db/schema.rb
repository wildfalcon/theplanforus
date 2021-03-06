# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091230173333) do

  create_table "events", :force => true do |t|
    t.string   "kind"
    t.string   "name"
    t.date     "date"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "primary",    :default => false, :null => false
  end

  create_table "leads", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.string   "ical_feed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "preparations", :force => true do |t|
    t.date     "date"
    t.time     "start"
    t.time     "end"
    t.string   "description"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",        :default => "Lesson", :null => false
  end

  create_table "subscription_levels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "allowed_plans"
    t.integer  "timeline_limit"
  end

  create_table "users", :force => true do |t|
    t.string   "username",              :default => "", :null => false
    t.string   "email",                 :default => "", :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count",           :default => 0,  :null => false
    t.integer  "failed_login_count",    :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token",      :default => "", :null => false
    t.integer  "subscription_level_id"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "confirmation_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
