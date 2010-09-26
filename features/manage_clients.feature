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
      And I check "Active"
      And I press "Create Region"
    Then I should see "Southeast"
      And I should see "Wally World"

    Given I am on the new store page
    When I select "Wally World" from "Client"
      And I select "Southeast" from "Region"
      And I select "Joe Manager" from "Manager"
      And I check "Active"
      And I fill in "Name" with "#1000 Wetumpka, AL"
      And I fill in "Address 1" with "4538 U.S. 231"
      And I fill in "City" with "Wetumpka"
      And I select "AL" from "State"
      And I fill in "Zipcode" with "36092"
      And I press "Create Store"
    Then I should see "Wally World"
      And I should see "Southeast"
      And I should see "#1000 Wetumpka, AL"
      And I should see "4538 U.S. 231"
      And I should see "AL"
      And I should see "36092"
      
      
