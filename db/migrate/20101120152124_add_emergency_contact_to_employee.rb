class AddEmergencyContactToEmployee < ActiveRecord::Migration
  def self.up
    add_column :employees, :emergency_contact_name, :string
    add_column :employees, :emergency_contact_phone, :string
  end

  def self.down
    remove_column :employees, :emergency_contact_phone
    remove_column :employees, :emergency_contact_name
  end
end
