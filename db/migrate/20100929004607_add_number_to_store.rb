class AddNumberToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :number, :integer
  end

  def self.down
    remove_column :stores, :number
  end
end
