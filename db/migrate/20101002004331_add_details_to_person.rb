class AddDetailsToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :ssn, :string
    add_column :people, :dob, :string
    add_column :people, :home_phone, :string
    add_column :people, :mobile_phone, :string
    add_column :people, :other_phone, :string
  end

  def self.down
    remove_column :people, :other_phone
    remove_column :people, :mobile_phone
    remove_column :people, :home_phone
    remove_column :people, :dob
    remove_column :people, :ssn
  end
end
