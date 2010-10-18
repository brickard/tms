class AddDateOfBirthToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :date_of_birth, :datetime
    remove_column :people, :dob
  end

  def self.down
    remove_column :people, :date_of_birth
    add_column :people, :dob, :string
  end
end
