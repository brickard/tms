class SetAdminFromRoles < ActiveRecord::Migration
  def self.up
    begin
      Role.find_by_name('Admin').users.each do |admin|
        admin.admin = true
        admin.save!
        puts "admin set true for #{admin.email}"
      end
    rescue
    end
  end

  def self.down
  end
end
