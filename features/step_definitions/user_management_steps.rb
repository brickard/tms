Given /^I am a user with email "([^"]*)" with password "([^"]*)"$/ do |email, password|
  @password, @email = password, email
  @user = User.new( :email => @email, :password => @password,
                    :password_confirmation => @password )
  @user.confirmed_at = Time.now
  @user.save!.should be_true
end

Given /^I am a person with first name "([^"]*)" and last name "([^"]*)"$/ do |first_name, last_name|
  @person = Person.new( :first_name => first_name, :last_name => last_name,
                        :user => @user)
  @person.save!.should be_true
  @person.user.should == @user
end

Given /^I have the role of "([^"]*)"$/ do |role_name|
  @role = Role.new( :name => role_name )
  @user.roles << @role
  @user.save!.should be_true
  @user.roles.include?(@role).should be_true
  UserRole.all.count.should == 1
end

Given /^I am logged in$/ do
  visit path_to('the new user session page')
  fill_in('user_email', :with => @email)
  fill_in('user_password', :with => @password)
  click_button('Sign in')
end

