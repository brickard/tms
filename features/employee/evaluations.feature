Feature: Employee Evaluations

  As an manager
  I want to manage employee evaluations

  Background: Manager and Employee Users Exists and Manager is logged in
    Given an employee_user "employee" exists with first_name: "Morpheus", middle_name: "X", last_name: "Fishburn"
    And a manager_user "neo" exists with email: "neo@matrix.com", password: "trinity", first_name: "Neo", last_name: "Anderson", middle_name: "A"
      And I login as manager_user "neo" with password "trinity"
      And I am on scoped employee_user edit page
      And I follow "Evaluations"

  Scenario: Manager User navigates to evaluations
    Then I should see "Evaluations for Morpheus X Fishburn"

  Scenario: Manager User adds evaluation
    Given I follow "New"
    Then I should see "New Evaluation for Morpheus X Fishburn"
      And I should see "Evaluations (0)"
    When I select "10" from "Attitude"
      And I select "10" from "Work Ethic"
      And I select "10" from "Communication"
      And I select "10" from "Abilities"
      And I select "10" from "Team Work"
      And I select "10" from "Appearance"
      And I select "10" from "Professionalism"
      And I select "10" from "Preparedness"
      And I select "10" from "Organization"
      And I select "10" from "Personal Finance and Goals"
      And I fill in the following:
      |Manager Comments|Great Employee!|
      |Employee Comments|I want more money!|
      And I press "Save"
    Then I should see "Evaluation was successfully added."
      And I should see "90"
      And I should see "Neo A Anderson"
      And I should see "Evaluations (1)"

  Scenario: Manager User edits evaluation
    Given an evaluation exists with employee: employee_user "employee"
      And I follow "Evaluations"
      And I follow "Edit"
      And I should see "Evaluations (1)"
    When I select "5" from "Organization"
      And I press "Save"
    Then I should see "Evaluation was successfully updated."
      And I should see "85"
      And I should see "Evaluations (1)"

  @javascript
  Scenario: Manager User edits evaluation
    Given an evaluation exists with employee: employee_user "employee"
      And I follow "Evaluations"
    When I follow "Delete" and click OK
    Then I should see "Evaluation was successfully deleted."
      And I should see "Evaluations (0)"

