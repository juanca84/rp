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

ActiveRecord::Schema.define(:version => 20140502131722) do

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

  create_table "agricultural_productions", :force => true do |t|
    t.integer  "department_id"
    t.integer  "community_id"
    t.integer  "register_id"
    t.string   "entry"
    t.integer  "physical_coverage_amount"
    t.string   "physical_coverage_unit"
    t.integer  "production_quantity"
    t.string   "production_unit"
    t.string   "production_system"
    t.string   "production_destination"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "agricultural_productions", ["community_id"], :name => "index_agricultural_productions_on_community_id"
  add_index "agricultural_productions", ["department_id"], :name => "index_agricultural_productions_on_department_id"
  add_index "agricultural_productions", ["register_id"], :name => "index_agricultural_productions_on_register_id"

  create_table "capitals", :force => true do |t|
    t.string   "capital_item"
    t.float    "current_value",   :default => 0.0
    t.float    "lifespan_future"
    t.integer  "start_year"
    t.integer  "land_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "register_id"
    t.integer  "department_id"
    t.integer  "community_id"
  end

  add_index "capitals", ["land_id"], :name => "index_capitals_on_land_id"

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
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "abbreviation"
  end

  create_table "economic_activities", :force => true do |t|
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

  create_table "entities", :force => true do |t|
    t.string   "business_name"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "code"
  end

  create_table "lands", :force => true do |t|
    t.float    "surface"
    t.string   "unit_of_measure"
    t.string   "tenure"
    t.boolean  "disassemble_without_permission", :default => false
    t.integer  "register_id"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "department_id"
    t.integer  "community_id"
    t.string   "another_community"
    t.integer  "own_labor",                      :default => 0
    t.integer  "eventual_labor",                 :default => 0
    t.integer  "permanent_labor",                :default => 0
    t.float    "men_per_year_own",               :default => 0.0
    t.float    "men_per_year_eventually",        :default => 0.0
    t.float    "men_per_year_total",             :default => 0.0
  end

  add_index "lands", ["community_id"], :name => "index_lands_on_community_id"
  add_index "lands", ["department_id"], :name => "index_lands_on_department_id"
  add_index "lands", ["register_id"], :name => "index_lands_on_register_id"

  create_table "partnerships", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "register_id"
    t.string   "community_name"
    t.boolean  "community_legal_status",    :default => false
    t.string   "greater_community"
    t.string   "productive_name_1"
    t.boolean  "productive_legal_status_1", :default => false
    t.integer  "economic_activity_1_1_id"
    t.string   "first_entry_1_1"
    t.string   "second_entry_1_1"
    t.string   "productive_name_2"
    t.boolean  "productive_legal_status_2", :default => false
    t.integer  "economic_activity_2_1_id"
    t.string   "first_entry_2_1"
    t.string   "second_entry_2_1"
    t.integer  "economic_activity_1_2_id"
    t.string   "first_entry_1_2"
    t.string   "second_entry_1_2"
    t.integer  "economic_activity_2_2_id"
    t.string   "first_entry_2_2"
    t.string   "second_entry_2_2"
  end

  add_index "partnerships", ["economic_activity_1_1_id"], :name => "index_partnerships_on_economic_activity_1_id"
  add_index "partnerships", ["economic_activity_2_1_id"], :name => "index_partnerships_on_economic_activity_2_id"

  create_table "partnerships_registers", :force => true do |t|
    t.integer  "register_id"
    t.integer  "partnership_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "partnerships_registers", ["partnership_id"], :name => "index_partnerships_registers_on_partnership_id"
  add_index "partnerships_registers", ["register_id"], :name => "index_partnerships_registers_on_register_id"

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "identification"
    t.date     "birthdate"
    t.string   "sex"
    t.integer  "education_id"
    t.integer  "civil_status_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "age"
    t.integer  "community_of_birth_id"
    t.string   "phone"
    t.string   "birthplace"
    t.string   "first_lastname"
    t.string   "second_lastname"
    t.integer  "department_of_birth_id"
    t.string   "province_of_birth_id"
    t.integer  "type_of_identification_id"
    t.integer  "issued_id"
  end

  add_index "people", ["department_of_birth_id"], :name => "index_people_on_department_of_birth_id"
  add_index "people", ["issued_id"], :name => "index_people_on_issued_id"
  add_index "people", ["province_of_birth_id"], :name => "index_people_on_province_of_birth_id"
  add_index "people", ["type_of_identification_id"], :name => "index_people_on_type_of_identification_id"

  create_table "people_registers", :force => true do |t|
    t.integer  "person_id"
    t.integer  "register_id"
    t.string   "type_person"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "town_of_birth"
    t.integer  "time_to_land",  :default => 0
  end

  add_index "people_registers", ["person_id"], :name => "index_people_registers_on_person_id"
  add_index "people_registers", ["register_id"], :name => "index_people_registers_on_register_id"

  create_table "productions", :force => true do |t|
    t.integer  "land_id"
    t.string   "entry"
    t.string   "production_destination"
    t.float    "production_quantity",      :default => 0.0
    t.string   "production_system"
    t.string   "production_unit"
    t.float    "physical_coverage_amount", :default => 0.0
    t.string   "physical_coverage_unit"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "register_id"
    t.integer  "department_id"
    t.integer  "community_id"
  end

  add_index "productions", ["land_id"], :name => "index_productions_on_land_id"

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "identification"
    t.string   "sex"
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.date     "birthdate"
    t.string   "second_last_name"
    t.integer  "type_of_identification_id"
    t.integer  "issued_id"
  end

  add_index "profiles", ["issued_id"], :name => "index_profiles_on_issued_id"
  add_index "profiles", ["type_of_identification_id"], :name => "index_profiles_on_type_of_identification_id"
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
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "residence"
    t.string   "address"
    t.integer  "department_id"
    t.integer  "community_id"
    t.string   "geodesic_ns"
    t.string   "geodesic_ew"
    t.string   "code_ine"
    t.integer  "user_id"
    t.string   "first_entry"
    t.string   "second_entry"
    t.date     "emission_date"
    t.integer  "emission_department_id"
    t.integer  "emission_community_id"
    t.integer  "economic_activity_id"
    t.string   "status"
    t.datetime "activation_date"
    t.integer  "type_residence_id"
  end

  add_index "registers", ["community_id"], :name => "index_registers_on_community_id"
  add_index "registers", ["department_id"], :name => "index_registers_on_department_id"
  add_index "registers", ["economic_activity_id"], :name => "index_registers_on_economic_activity_id"
  add_index "registers", ["emission_community_id"], :name => "index_registers_on_emission_community_id"
  add_index "registers", ["emission_department_id"], :name => "index_registers_on_emission_department_id"
  add_index "registers", ["type_residence_id"], :name => "index_registers_on_type_residence_id"
  add_index "registers", ["user_id"], :name => "index_registers_on_user_id"

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

  create_table "type_of_identifications", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_residences", :force => true do |t|
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
    t.integer  "entity_id"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["entity_id"], :name => "index_users_on_entity_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.integer  "register_id"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"
  add_index "versions", ["parent_id"], :name => "index_versions_on_parent_id"
  add_index "versions", ["register_id"], :name => "index_versions_on_register_id"

  create_table "works", :force => true do |t|
    t.integer  "own_labor",               :default => 0
    t.integer  "eventual_labor",          :default => 0
    t.integer  "permanent_labor",         :default => 0
    t.float    "men_per_year_own",        :default => 0.0
    t.float    "men_per_year_eventually", :default => 0.0
    t.float    "men_per_year_total",      :default => 0.0
    t.integer  "register_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "works", ["register_id"], :name => "index_works_on_register_id"

end
