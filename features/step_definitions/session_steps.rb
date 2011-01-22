
Given /^I am logged in$/ do
  visit path_to('the new user session page')
  fill_in('user_email', :with => @email)
  fill_in('user_password', :with => @password)
  click_button('Sign In')
end

Given /^I login as #{capture_model} with password "([^"]*)"$/ do |cmodel, password|
  user = model!(cmodel)
  steps %Q{
    Given I am on the new user session page
    When I fill in "Email" with "#{user.email}"
      And I fill in "Password" with "#{password}"
      And I press "Sign In"
    Then I should not see "Sign In"
  }
end

