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

ActiveRecord::Schema.define(:version => 20140121155504) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "civil_statuses", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "civil_unions", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "communities", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "communities", ["province_id"], :name => "index_communities_on_province_id"

  create_table "departments", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "educations", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ethnicities", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "first_lastname"
    t.string   "second_lastname"
    t.string   "identification"
    t.date     "birthdate"
    t.string   "sex"
    t.integer  "type_identification_id"
    t.integer  "ethnicity_id"
    t.integer  "education_id"
    t.integer  "civil_status_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "people_registers", :force => true do |t|
    t.integer  "person_id"
    t.integer  "register_id"
    t.string   "type_person"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "time_to_land"
    t.string   "mothers_name"
    t.string   "town_of_birth"
  end

  add_index "people_registers", ["person_id"], :name => "index_people_registers_on_person_id"
  add_index "people_registers", ["register_id"], :name => "index_people_registers_on_register_id"

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "identification"
    t.string   "birthdate"
    t.string   "sex"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "provinces", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "department_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "provinces", ["department_id"], :name => "index_provinces_on_department_id"

  create_table "regions_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "regionable_id"
    t.string   "regionable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "regions_users", ["regionable_id", "regionable_type"], :name => "index_regions_users_on_regionable_id_and_regionable_type"
  add_index "regions_users", ["user_id"], :name => "index_regions_users_on_user_id"

  create_table "registers", :force => true do |t|
    t.integer  "code"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "civil_union_id"
    t.string   "residence"
    t.string   "address"
    t.integer  "department_id"
    t.integer  "community_id"
    t.string   "geodesic_ns"
    t.string   "geodesic_ew"
    t.string   "code_ine"
  end

  add_index "registers", ["civil_union_id"], :name => "index_registers_on_civil_union_id"
  add_index "registers", ["community_id"], :name => "index_registers_on_community_id"
  add_index "registers", ["department_id"], :name => "index_registers_on_department_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "roles_runpa_modules", :force => true do |t|
    t.integer  "role_id"
    t.integer  "runpa_module_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "roles_runpa_modules", ["role_id"], :name => "index_roles_runpa_modules_on_role_id"
  add_index "roles_runpa_modules", ["runpa_module_id"], :name => "index_roles_runpa_modules_on_runpa_module_id"

  create_table "runpa_modules", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_identifications", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,    :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.datetime "last_seen_at"
    t.boolean  "active",                 :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
