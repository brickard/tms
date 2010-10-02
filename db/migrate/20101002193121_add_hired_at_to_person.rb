class AddHiredAtToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :hired_at, :datetime
  end

  def self.down
    remove_column :people, :hired_at
  end
end
