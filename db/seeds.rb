# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
%w{ Admin StoreManager }.each do |role_name|
  Role.create!(:name => role_name)
end
%w{ bram@craniumisajar.com bryonr@att.net admin@storeresetter.com }.each do |email|
  user = User.new(:email => email, :password => '!password!',
                  :password_confirmation => '!password!')
  person = Person.create(:hired_at => DateTime.now)
  user.person = person
  user.skip_confirmation!
  user.roles << Role.find_by_name('Admin')
  user.save!
end

