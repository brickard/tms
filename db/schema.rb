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

ActiveRecord::Schema.define(:version => 20101111034350) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_skills", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.integer  "person_id"
    t.boolean  "needs_special_hours"
    t.text     "needs_special_hours_detail"
    t.datetime "available_at"
    t.boolean  "has_reliable_vehicle"
    t.boolean  "can_travel_long_term"
    t.boolean  "been_convicted"
    t.text     "been_convicted_detail"
    t.boolean  "ever_failed_drug_test"
    t.boolean  "legal_us_worker"
    t.boolean  "applied_before"
    t.text     "applied_before_detail"
    t.boolean  "drivers_license_valid"
    t.string   "drivers_license_state"
    t.string   "drivers_license_number"
    t.datetime "drivers_license_expiration"
    t.boolean  "drivers_license_ever_suspended"
    t.text     "drivers_license_ever_suspended_detail"
    t.boolean  "agree_to_terms"
    t.datetime "agree_to_terms_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers", :force => true do |t|
    t.integer  "employee_id"
    t.string   "company_name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "phone_number"
    t.string   "job_title"
    t.string   "supervisor_name"
    t.string   "start_salary"
    t.string   "end_salary"
    t.string   "reason_for_leaving"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ssn"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "other_phone"
    t.datetime "hired_at"
    t.datetime "date_of_birth"
    t.boolean  "application_agreement_agreed"
    t.date     "application_agreement_agreed_on"
    t.integer  "form_step"
  end

  create_table "projects", :force => true do |t|
    t.integer  "store_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", :force => true do |t|
    t.integer  "employee_id"
    t.string   "name"
    t.string   "contact_info"
    t.string   "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_of_reference"
  end

  create_table "regions", :force => true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifts", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", :force => true do |t|
    t.integer  "client_id"
    t.integer  "region_id"
    t.integer  "manager_id"
    t.boolean  "active"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
  end

  create_table "uniform_orders", :force => true do |t|
    t.integer  "employee_id"
    t.string   "shirt_size"
    t.integer  "shirt_count"
    t.string   "hat_size"
    t.integer  "hat_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
