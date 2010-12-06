Feature: Manage Users and thier Roles

  As a User
  I want to manage other Users and thier Roles
  So that the users can have varying levels of access

  Scenario: As an Admin user I add an admin user to the system
    Given a admin_user: "joe" exists with email: "admin@matrix.com", password: "admin_password", first_name: "Joe", last_name: "Admin", middle_name: "The"
      And I am on the new user session page
      And I fill in "Email" with "admin@matrix.com"
      And I fill in "Password" with "admin_password"
      And I press "sign_in"
      And I am on the new admin page
    When I fill in "UserID" with "joe@blow.com"
      And I fill in "Password" with "password"
      And I fill in "First name" with "Joe"
      And I fill in "Last name" with "Blow"
      And I press "Save"
    Then a admin_user: "joe_user" should exist with email: "joe@blow.com"
      And I should see "Joe Blow"
      And I should see "joe@blow.com"
