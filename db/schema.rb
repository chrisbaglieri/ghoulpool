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

ActiveRecord::Schema.define(:version => 20110411035354) do

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ghoul_id"
    t.integer  "pool_id"
    t.integer  "points",     :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["ghoul_id"], :name => "index_entries_on_ghoul_id"
  add_index "entries", ["pool_id"], :name => "index_entries_on_pool_id"
  add_index "entries", ["user_id"], :name => "index_entries_on_user_id"

  create_table "ghouls", :force => true do |t|
    t.string   "name",        :null => false
    t.date     "born_on",     :null => false
    t.date     "died_on"
    t.string   "freebase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ghouls", ["freebase_id"], :name => "index_ghouls_on_freebase_id", :unique => true
  add_index "ghouls", ["name"], :name => "index_ghouls_on_name", :unique => true

  create_table "pools", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "picks"
  end

  add_index "pools", ["user_id"], :name => "index_pools_on_user_id"

  create_table "pools_users", :id => false, :force => true do |t|
    t.integer "pool_id"
    t.integer "user_id"
  end

  add_index "pools_users", ["pool_id"], :name => "pools_users_pool_id"
  add_index "pools_users", ["user_id"], :name => "pools_users_user_id"

  create_table "rules", :force => true do |t|
    t.integer  "pool_id"
    t.string   "function"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rules", ["pool_id"], :name => "index_rules_on_pool_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
