class DropRolesAndUserRoles < ActiveRecord::Migration
  def self.up
    drop_table(:user_roles)
    drop_table(:roles)
  end

  def self.down
  end
end
