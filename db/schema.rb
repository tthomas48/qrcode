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

ActiveRecord::Schema.define(:version => 20111114154834) do

  create_table "menu_items", :force => true do |t|
    t.string   "label"
    t.string   "url"
    t.string   "image"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bitly_url"
  end

  add_index "menu_items", ["menu_id"], :name => "index_menu_items_on_menu_id"

  create_table "menus", :force => true do |t|
    t.string   "label"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "bitly_url"
  end

  create_table "metric_dates", :force => true do |t|
    t.datetime "showdate"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "metric_dates", ["menu_id"], :name => "index_metric_dates_on_menu_id"

  create_table "metrics", :force => true do |t|
    t.integer  "metric_date_id"
    t.string   "metric"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "metrics", ["metric_date_id"], :name => "index_metrics_on_metric_date_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
