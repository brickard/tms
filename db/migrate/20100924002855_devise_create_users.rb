class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :email, :null => false, :unique => true
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.string  :role
      t.string  :form_step, :default => 'step0'
      t.string  :last_name
      t.string  :first_name
      t.string  :middle_name
      t.string  :address1
      t.string  :address2
      t.string  :city
      t.string  :state
      t.string  :zipcode
      t.string  :home_phone
      t.string  :mobile_phone
      t.string  :other_phone
      t.string  :ssn
      t.string  :date_of_birth
      t.date    :hired_at
      t.boolean :needs_special_hours
      t.text :needs_special_hours_detail
      t.date :available_at
      t.boolean :has_reliable_vehicle
      t.boolean :can_travel_long_term
      t.boolean :been_convicted
      t.text :been_convicted_detail
      t.boolean :ever_failed_drug_test
      t.boolean :legal_us_worker
      t.boolean :applied_before
      t.text :applied_before_detail
      t.boolean :drivers_license_valid
      t.string :drivers_license_state
      t.string :drivers_license_number
      t.date :drivers_license_expiration
      t.boolean :drivers_license_ever_suspended
      t.text :drivers_license_ever_suspended_detail
      t.boolean :agree_to_terms
      t.date :agree_to_terms_date
      t.string  :emergency_contact_name 
      t.string  :emergency_contact_phone
      t.string :shirt_size
      t.integer :shirt_count
      t.string :hat_size
      t.integer :hat_count
      t.integer :shift_id

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :unlock_token,         :unique => true
    add_index :users, :role
  end

  def self.down
    drop_table :users
  end
end
