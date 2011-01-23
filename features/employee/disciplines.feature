Feature: Employee Disciplines

  As an manager
  I want to manage employee disciplines

  Background: Manager and Employee Users Exists and Manager is logged in
    Given an employee_user "employee" exists with first_name: "Morpheus", middle_name: "X", last_name: "Fishburn"
      And a manager_user "neo" exists with email: "neo@matrix.com", password: "theone", first_name: "Neo", middle_name: "A", last_name: "Anderson"
      And a store "neos_store" exists with manager: manager_user "neo", name: "Neos Store"
      And I login as manager_user "neo" with password "theone"
      And I am on scoped employee_user edit page
      And I follow "Discipline"

  Scenario: Manager User navigates to disciplines
    Then I should see "Discipline for Morpheus X Fishburn"
      And I should see "Discipline (0)"

  Scenario: Manager User adds discipline
    Given I follow "New"
      Then I should see "New Discipline for Morpheus X Fishburn"
    When I fill in the following:
      |Incident Name|Sleeping on the Job Incident|
      |Date of Incident|2011-01-22|
      |Date of Verbal Warning|2010-12-01|
      |Subject of Verbal Warning|Sleeping on the Job Subject|
      |Reason for Verbal Warning|Sleeping on the Job Reason|
      |Action to be taken if not addressed|Termination|
      |Date of Possible Termination|2011-02-15|
      And I select "Neo A Anderson" from "Supervisor"
      And I select "Neos Store" from "Store"
      And I press "Save"
    Then I should see "Discipline was successfully added."
      And I should see "Sleeping on the Job Incident"
      And I should see "Neo A Anderson"
      And I should see "Neos Store"
      And I should see "Discipline (1)"

  Scenario: Manager User edits discipline
    Given an discipline exists with employee: employee_user "employee"
      And I follow "Discipline"
      And I follow "Edit"
      And I should see "Discipline (1)"
    When I fill in "Incident Name" with "Sleeping again..."
      And I press "Save"
    Then I should see "Discipline was successfully updated."
      And I should see "Sleeping again..."
      And I should see "Discipline (1)"

  @javascript
  Scenario: Manager User deletes discipline
    Given an discipline exists with employee: employee_user "employee"
      And I follow "Discipline"
    When I follow "Delete" and click OK
    Then I should see "Discipline was successfully deleted."
      And I should see "Discipline (0)"

