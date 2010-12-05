class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.integer :user_id
      t.boolean :needs_special_hours
      t.text :needs_special_hours_detail
      t.datetime :available_at
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
      t.datetime :drivers_license_expiration
      t.boolean :drivers_license_ever_suspended
      t.text :drivers_license_ever_suspended_detail
      t.boolean :agree_to_terms
      t.datetime :agree_to_terms_date
      t.string  :emergency_contact_name 
      t.string  :emergency_contact_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
