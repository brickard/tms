
Given /^I am logged in$/ do
  visit path_to('the new user session page')
  fill_in('user_email', :with => @email)
  fill_in('user_password', :with => @password)
  click_button('Sign in')
end

