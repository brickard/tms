Feature: Employee Accidents

  As an manager
  I want to manage employee accidents

  Background: Manager and Employee Users Exists and Manager is logged in
    Given an employee_user "employee" exists with first_name: "Morpheus", middle_name: "X", last_name: "Fishburn"
      And a manager_user "neo" exists with email: "neo@matrix.com", password: "theone", first_name: "Neo", middle_name: "A", last_name: "Anderson"
      And a store exists with manager: manager_user "neo", name: "Neos Store"
      And I login as manager_user "neo" with password "theone"
      And I am on scoped employee_user edit page
      And I follow "Accidents"

  Scenario: Manager User navigates to accidents
    Then I should see "Accidents for Morpheus X Fishburn"

  Scenario: Manager User adds accident
    Given I follow "New"
      Then I should see "New Accident for Morpheus X Fishburn"
      And I should see "Accidents (0)"
    When I fill in the following:
      |Date|2011-01-22|
      |Description|Slipped and fell|
      |Witnesses|None|
      |People Involved|None|
      |Part of Body Injured|None|
      |Supervisor Comments|Hes fine.|
      And I select the following:
        |Supervisor|Neo A Anderson|
        |Store|Neos Store|
        |Requires Medical Care|No|
        |Went to Emergency Room|No|
        |accident[needs_further_care]|No|
        |Employee Needs Time Off|No|
        |How Many Days|4|
        |Proper Safety Procedures Followed|Yes|
        |Employee Can Return to Work|Yes|
      And I press "Save"
    Then I should see "Accident was successfully added."
      And I should see "Slipped and fell"
      And I should see "Accidents (1)"

  Scenario: Manager User edits accident
    Given an accident exists with employee: employee_user "employee"
      And I follow "Accidents"
      And I follow "Edit"
      And I should see "Accidents (1)"
    When I fill in "Description" with "Slipped and fell again."
      And I press "Save"
    Then I should see "Accident was successfully updated."
      And I should see "Slipped and fell again."
      And I should see "Accidents (1)"

  @javascript
  Scenario: Manager User edits accident
    Given an accident exists with employee: employee_user "employee"
      And I follow "Accidents"
    When I follow "Delete" and click OK
    Then I should see "Accident was successfully deleted."
      And I should see "Accidents (0)"

