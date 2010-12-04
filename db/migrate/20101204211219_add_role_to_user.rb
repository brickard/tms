class AddRoleToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string
    add_index :users, [ :role ]
  end

  def self.down
    remove_column :users, :role
  end
end
