Given /^I have the role of "([^"]*)"$/ do |role_name|
  @role = Role.new( :name => role_name )
  @user.roles << @role
  @user.save!.should be_true
  @user.roles.include?(@role).should be_true
end

