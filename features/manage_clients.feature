Feature: Manage Clients

  A as User with Manager Role
  I Want to Manage Clients
  So I can manage other data about them

  Scenario: Manager manages the entire lifecycle of a Client
    Given a manager_user: "joe" exists with email: "manager@srst.com", password: "manager_password", first_name: "Joe", last_name: "Manager", middle_name: "The"
      And I am on the new user session page
    When I fill in "Email" with "manager@srst.com"
      And I fill in "Password" with "manager_password"
      And I press "sign_in"

    Given I am on the new client page
    When I fill in "Name" with "Wally World"
      And I check "Active"
      And I press "Save"
    Then I should see "Wally World"
      And a client "wallyworld" should exist with name: "Wally World"
    
    Given I am on the new region page
    When I fill in "Name" with "Southeast"
      And I select "Wally World" from "Client"
      And I check "Active"
      And I press "Save"
    Then I should see "Southeast"
      And I should see "Wally World"
      And a region "southeast" should exist with name: "Southeast", client: client "wallyworld"

    Given I am on the new store page
    When I select "Wally World" from "Client"
      And I select "Southeast" from "Region"
      And I select "Joe The Manager" from "Manager"
      And I check "Active"
      And I fill in "Number" with "1000"
      And I fill in "Name" with "Wetumpka West 1"
      And I fill in "Address1" with "4538 U.S. 231"
      And I fill in "City" with "Wetumpka"
      And I select "Alabama" from "State"
      And I fill in "Zipcode" with "36092"
      And I press "Save"
    Then I should see "Wally World"
      And I should see "Southeast"
      And I should see "1000"
      And I should see "Wetumpka West 1"
      And I should see "4538 U.S. 231"
      And I should see "AL"
      And I should see "36092"
      And a store "wetumpka" should exist with name: "Wetumpka West 1", client: client "wallyworld", region: region "southeast"

    Given I am on the new project page
    When I select "Wetumpka West 1" from "Store"
      And I fill in "Name" with "Remodel"
      And I press "Save"
    Then I should see "Wetumpka West 1"
      And I should see "Remodel"
      And a project "remodel" should exist with name: "Remodel", store: store "wetumpka"
      
    Given I am on the new shift page
    When I select "Wally World | Wetumpka West 1 | Remodel" from "Project"
      And I fill in "Name" with "1st Shift"
      And I press "Save"
    Then I should see "Remodel"
      And I should see "1st Shift"
      And a shift "shift1" should exist with name: "1st Shift", project: project "remodel"

