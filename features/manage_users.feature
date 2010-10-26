Feature: Manage Users and thier Roles

  As a User
  I want to manage other Users and thier Roles
  So that the users can have varying levels of access

  Scenario: As an Admin user I add an admin user to the system
    Given I am a user with email "bram@craniumisajar.com" and password "thepass"
      And I have the role of "Admin"
      And I am logged in
      And I am on the new user page
    When I fill in "Email" with "joe@blow.com"
      And I fill in "Password" with "password"
      And I fill in "First name" with "Joe"
      And I fill in "Last name" with "Blow"
      And I check "Admin"
      And I fill in "Address 1" with "200 SE First Street"
      And I fill in "Address 2" with "Suite 400"
      And I fill in "City" with "Miami"
      And I select "Alabama" from "State"
      And I fill in "Zipcode" with "33131"
      And I fill in "Home phone" with "2055551212"
      And I fill in "Mobile phone" with "2055552121"
      And I press "Create User"
    Then I should see "User was successfully created"
      And I should see "Joe Blow"
      And I should see "joe@blow.com"