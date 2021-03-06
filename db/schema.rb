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

ActiveRecord::Schema.define(:version => 20110205152244) do

  create_table "accidents", :force => true do |t|
    t.integer  "employee_id"
    t.datetime "occured_on"
    t.integer  "supervisor_id"
    t.integer  "store_id"
    t.text     "description"
    t.string   "witnesses"
    t.string   "people_involved"
    t.string   "injury_location"
    t.boolean  "required_medical_care"
    t.boolean  "sent_to_er"
    t.boolean  "needs_further_care"
    t.boolean  "miss_work"
    t.integer  "miss_work_days"
    t.boolean  "safety_procedures_followed"
    t.boolean  "returning_to_work"
    t.text     "supervisor_comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplines", :force => true do |t|
    t.string   "name"
    t.date     "occured_on"
    t.integer  "store_id"
    t.date     "verbal_warning_on"
    t.string   "verbal_warning_subject"
    t.text     "verbal_warning_reason"
    t.text     "verbal_warning_action"
    t.date     "possible_termination_on"
    t.integer  "supervisor_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers", :force => true do |t|
    t.integer  "user_id"
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

  create_table "evaluations", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "manager_id"
    t.integer  "attitude"
    t.integer  "work_ethic"
    t.integer  "communication"
    t.integer  "abilities"
    t.integer  "team_work"
    t.integer  "appearance"
    t.integer  "professionalism"
    t.integer  "preparedness"
    t.integer  "organization"
    t.integer  "goals"
    t.text     "manager_comments"
    t.text     "employee_comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", :force => true do |t|
    t.date     "submitted_at"
    t.string   "description"
    t.integer  "amount"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incidents", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "supervisor_id"
    t.date     "occured_on"
    t.string   "people_involved"
    t.integer  "store_id"
    t.string   "witnesses"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.integer  "store_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "contact_info"
    t.string   "relationship"
    t.string   "type_of_reference"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.boolean  "active"
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
    t.integer  "number"
    t.boolean  "active"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uniforms", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "count"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_skills", :force => true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                :default => "",      :null => false
    t.string   "encrypted_password",                    :limit => 128, :default => "",      :null => false
    t.string   "password_salt",                                        :default => "",      :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                                      :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "role"
    t.string   "form_step",                                            :default => "step0"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "other_phone"
    t.string   "ssn"
    t.string   "date_of_birth"
    t.date     "hired_at"
    t.boolean  "needs_special_hours"
    t.text     "needs_special_hours_detail"
    t.date     "available_at"
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
    t.date     "drivers_license_expiration"
    t.boolean  "drivers_license_ever_suspended"
    t.text     "drivers_license_ever_suspended_detail"
    t.boolean  "agree_to_terms"
    t.date     "agree_to_terms_date"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_phone"
    t.string   "shirt_size"
    t.integer  "shift_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "application_complete"
    t.integer  "pay_rate",                                             :default => 0
    t.integer  "per_diem",                                             :default => 0
    t.integer  "pin_code"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role"], :name => "index_users_on_role"
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "vacations", :force => true do |t|
    t.integer  "employee_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "reason"
    t.text     "explanation"
    t.integer  "store_id"
    t.boolean  "approved",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
