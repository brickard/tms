Feature: Employee Uniforms

  As an manager
  I want to manage employee uniforms

  Background: Manager and Employee Users Exists and Manager is logged in
    Given an employee_user "employee" exists with first_name: "Morpheus", middle_name: "X", last_name: "Fishburn"
      And a manager_user "neo" exists with email: "neo@matrix.com", password: "theone"
      And I login as manager_user "neo" with password "theone"
      And I am on scoped employee_user edit page
      And I follow "Uniforms"

  Scenario: Manager User navigates to uniforms
    Then I should see "Uniforms for Morpheus X Fishburn"

  Scenario: Manager User adds uniform
    Given I follow "New"
      Then I should see "New Uniform for Morpheus X Fishburn"
      And I should see "Uniforms (0)"
    When I select "4" from "# of Shirts"
      And I select "XL" from "Shirt Size"
      And I press "Save"
    Then I should see "Uniform was successfully added."
      And I should see "XL"
      And I should see "4"
      And I should see "Uniforms (1)"

  Scenario: Manager User edits uniform
    Given an uniform exists with employee: employee_user "employee", count: 10
      And I follow "Uniforms"
      And I follow "Edit"
      And I should see "Uniforms (1)"
    When I select "2" from "# of Shirts"
      And I press "Save"
    Then I should see "Uniform was successfully updated."
      And I should see "2"
      And I should see "Uniforms (1)"

  @javascript
  Scenario: Manager User edits uniform
    Given an uniform exists with employee: employee_user "employee"
      And I follow "Uniforms"
    When I follow "Delete" and click OK
    Then I should see "Uniform was successfully deleted."
      And I should see "Uniforms (0)"

