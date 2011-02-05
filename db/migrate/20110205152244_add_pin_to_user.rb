class AddPinToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :pin_code, :integer
  end

  def self.down
    remove_column :users, :pin_code
  end
end
