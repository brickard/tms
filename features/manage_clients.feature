Feature: Manage Clients

  A as User with Manager Role
  I Want to Manage Clients
  So I can manage other data about them

  Scenario:
    Given I am a user with email "manager@srst.com" with password "manager_password"
      And I am a person with first name "Joe" and last name "Manager"
      And I have the role of "manager"
      And I am logged in
      And I am on the new client page
    When I fill in "Name" with "Wally World"
      And I check "Active"
      And I press "Create Client"
    Then I should see "Wally World"
    
    Given I am on the new region page
    When I fill in "Name" with "Southeast"
      And I select "Wally World" from "Client"
      And I press "Create Region"
    Then I should see "Southeast"
      And I should see "Wally World"
      
      
