class RemoveUserIdFromPerson < ActiveRecord::Migration
  def self.up
    remove_column :people, :user_id
  end

  def self.down
    add_column :people, :user_id, :integer
  end
end
