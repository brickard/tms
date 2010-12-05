# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
# load factory_girl
require 'faker'
require 'factory_girl'
Dir[Rails.root.join("spec/factories/**/*.rb"), 
    Rails.root.join("spec/factories.rb")].each {|f| require f}

[ 
  { :email => 'bram@craniumisajar.com', :first_name => 'Bram', :last_name => 'Swenson' },
  { :email => 'bryonr@att.net', :first_name => 'Bryon', :last_name => 'Rickard' },
  { :email => 'admin@storeresetter.com', :first_name => 'Admin', :last_name => 'User' },
].each do |user_params|
  user_params.merge!(:password => '!password!', 
                     :password_confirmation => '!password!',
                     :role => 'admin')
  user = User.new(Factory.attributes_for(:admin_user, user_params))
  user.save!
end
@skills = []
%w{ Management Merchandiser Carpenter FixtureInstaller }.each do |skill_name|
  @skills << Skill.create!(:name => skill_name)
end

100.times do
  u = User.new(Factory.attributes_for(:applicant_user))
  (1..rand(@skills.size+1)).each do |i|
    u.skills << @skills[rand(@skills.size)]
  end
  u.skills << @skills[rand(@skills.size)] unless u.skills.count >= 1
  u.save!
  puts "Created applicant: #{u.email} with skills: #{u.skills.map{ |s| s.name }.join(', ')}"
end

