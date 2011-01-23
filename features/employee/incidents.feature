Feature: Employee Incidents

  As an manager
  I want to manage employee incidents

  Background: Manager and Employee Users Exists and Manager is logged in
    Given an employee_user "employee" exists with first_name: "Morpheus", middle_name: "X", last_name: "Fishburn"
      And a manager_user "neo" exists with email: "neo@matrix.com", password: "theone", first_name: "Neo", middle_name: "A", last_name: "Anderson"
      And a store exists with manager: manager_user "neo", name: "Neos Store"
      And I login as manager_user "neo" with password "theone"
      And I am on scoped employee_user edit page
      And I follow "Incidents"

  Scenario: Manager User navigates to incidents
    Then I should see "Incidents for Morpheus X Fishburn"

  Scenario: Manager User adds incident
    Given I follow "New"
      Then I should see "New Incident for Morpheus X Fishburn"
      And I should see "Incidents (0)"
    When I fill in the following:
      |Date|2011-01-22|
      |Description|Car Crash|
      |Witnesses|None|
      |People Involved|None|
      And I select the following:
        |Supervisor|Neo A Anderson|
        |Store|Neos Store|
      And I press "Save"
    Then I should see "Incident was successfully added."
      And I should see "Neos Store"
      And I should see "Incidents (1)"

  Scenario: Manager User edits incident
    Given an incident exists with employee: employee_user "employee"
      And I follow "Incidents"
      And I follow "Edit"
      And I should see "Incidents (1)"
    When I fill in "Description" with "Slipped and fell again."
      And I press "Save"
    Then I should see "Incident was successfully updated."
      And I should see "Incidents (1)"

  @javascript
  Scenario: Manager User edits incident
    Given an incident exists with employee: employee_user "employee"
      And I follow "Incidents"
    When I follow "Delete" and click OK
    Then I should see "Incident was successfully deleted."
      And I should see "Incidents (0)"

