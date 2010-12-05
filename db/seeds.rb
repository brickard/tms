# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
[ 
  { :email => 'bram@craniumisajar.com', :first_name => 'Bram', :last_name => 'Swenson' },
  { :email => 'bryonr@att.net', :first_name => 'Bryon', :last_name => 'Rickard' },
  { :email => 'admin@storeresetter.com', :first_name => 'Admin', :last_name => 'User' },
].each do |user_params|
  user_params.merge!(:password => '!password!', 
                     :password_confirmation => '!password!',
                     :role => 'admin')
  user = User.new(user_params)
  user.save!
end
%w{ Management Merchandiser Carpenter FixtureInstaller }.each do |skill_name|
  Skill.create!(:name => skill_name)
end
