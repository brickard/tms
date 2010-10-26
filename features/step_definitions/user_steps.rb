Given /^I am a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  @password, @email = password, email
  @user = User.new( :email => @email, :password => @password,
                    :password_confirmation => @password )
  @user.skip_confirmation!
  @user.save!.should be_true
end

