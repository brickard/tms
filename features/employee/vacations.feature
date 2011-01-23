Feature: Employee Vacations

  As an manager
  I want to manage employee vacations

  Background: Manager and Employee Users Exists and Manager is logged in
    Given an employee_user "employee" exists with first_name: "Morpheus", middle_name: "X", last_name: "Fishburn"
      And a manager_user "neo" exists with email: "neo@matrix.com", password: "theone", first_name: "Neo", middle_name: "A", last_name: "Anderson"
      And a store exists with manager: manager_user "neo", name: "Neos Store"
      And I login as manager_user "neo" with password "theone"
      And I am on scoped employee_user edit page
      And I follow "Vacations"

  Scenario: Manager User navigates to vacations
    Then I should see "Vacations for Morpheus X Fishburn"

  Scenario: Manager User adds vacation
    Given I follow "New"
      Then I should see "New Vacation for Morpheus X Fishburn"
      And I should see "Vacations (0)"
    When I fill in the following:
      |Start Date|2011-02-01|
      |To Date|2011-02-04|
      |Explanation|Vaction to tahiti|
      And I select "Personal" from "Reason"
      And I select "Neos Store" from "Store"
      And I press "Save"
    Then I should see "Vacation was successfully added."
      And I should see "Personal"
      And I should see "Vacations (1)"

  Scenario: Manager User edits vacation
    Given an vacation exists with employee: employee_user "employee"
      And I follow "Vacations"
      And I follow "Edit"
      And I should see "Vacations (1)"
    When I fill in "Explanation" with "Quick vacation to Tahiti"
      And I press "Save"
    Then I should see "Vacation was successfully updated."
      And I should see "Quick vacation to Tahiti"
      And I should see "Vacations (1)"

  @javascript
  Scenario: Manager User edits vacation
    Given an vacation exists with employee: employee_user "employee"
      And I follow "Vacations"
    When I follow "Delete" and click OK
    Then I should see "Vacation was successfully deleted."
      And I should see "Vacations (0)"

