Feature: Manage Users and thier Roles

  As a User
  I want to manage other Users and thier Roles
  So that the users can have varying levels of access

  Scenario: As an Admin user I add an admin user to the system
    Given a person "joe" exists with first_name: "Joe", last_name: "Admin", middle_name: ""
      And a user "joe" exists with email: "admin@matrix.com", password: "admin_password", person: person "joe", admin: "true"
      And I am on the new user session page
      And I fill in "Email" with "admin@matrix.com"
      And I fill in "Password" with "admin_password"
      And I check "Remember me"
      And I press "sign_in"
      And I am on the new user page
    When I fill in "UserID" with "joe@blow.com"
      And I fill in "Password" with "password"
      And I fill in "First name" with "Joe"
      And I fill in "Last name" with "Blow"
      And I check "Admin"
      And I fill in "Address" with "200 SE First Street"
      And I fill in "Address Line 2" with "Suite 400"
      And I fill in "City" with "Miami"
      And I select "Alabama" from "State"
      And I fill in "Zipcode" with "33131"
      And I fill in "Primary phone" with "2055551212"
      And I fill in "Secondary phone" with "2055552121"
      And I press "save"
    Then a person: "joe_person" should exist with first_name: "Joe", last_name: "Blow"
      And a user: "joe_user" should exist with email: "joe@blow.com", person: person "joe_person"
      And I should see "Joe Blow"
      And I should see "joe@blow.com"
