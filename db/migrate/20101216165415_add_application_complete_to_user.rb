class AddApplicationCompleteToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :application_complete, :boolean
  end

  def self.down
    remove_column :users, :application_complete
  end
end
