# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
%w{ bram@craniumisajar.com bryonr@att.net admin@storeresetter.com }.each do |email|
  user = User.new(:email => email, :password => '!password!',
                  :password_confirmation => '!password!',
                  :admin => true)
  person = Person.create(:hired_at => DateTime.now, :first_name => 'Firstname', 
                         :last_name => 'Lastname')
  user.person = person
  user.skip_confirmation!
  user.save!
end
%w{ Management Merchandiser Carpenter FixtureInstaller }.each do |skill_name|
  Skill.create!(:name => skill_name)
end
