Feature: Employee Navigation

  As an manager
  I want to navigate the employees dataset
  So that I can manage it

  Background: Manager and Employee Users Exists and Manager is logged in
    Given a employee_user "employee" exists
      And a manager_user "morpheus" exists with email: "morpheus@matrix.com", password: "theone"
      And I login as manager_user "morpheus" with password "theone"
      And I am on scoped employee_user edit page

  Scenario: Manager User navigates to contact info
    When I follow "Contact Info"
    Then I should see "Contact Info for"

  Scenario: Manager User edits contact info
    When I follow "Contact Info"
      And I fill in "Address" with "200 Matrix Avenue"
      And I press "Save"
      And show me the page
    Then I should see "Employee was successfully updated."

  Scenario: Manager User navigates to evaluations
    When I follow "Evaluations"
    Then I should see "Evaluations for"

  Scenario: Manager User navigates to discipline
    When I follow "Discipline"
    Then I should see "Discipline for"

  Scenario: Manager User navigates to payroll
    When I follow "Payroll"
    Then I should see "Payroll for"

  Scenario: Manager User navigates to expenses
    When I follow "Expenses"
    Then I should see "Expenses for"

  Scenario: Manager User navigates to vacation
    When I follow "Vacations"
    Then I should see "Vacations for"

  @wip
  Scenario: Manager User navigates to uniforms
    When I follow "Uniforms"
    Then I should see "Uniforms for"

  @wip
  Scenario: Manager User navigates to accidents
    When I follow "Accidents"
    Then I should see "Accidents for"

  @wip
  Scenario: Manager User navigates to incidents
    When I follow "Incidents"
    Then I should see "Incidents for"

