Feature: Employee Expenses

  As an manager
  I want to manage employee expenses

  Background: Manager and Employee Users Exists and Manager is logged in
    Given an employee_user "employee" exists with first_name: "Morpheus", middle_name: "X", last_name: "Fishburn"
      And a manager_user "morpheus" exists with email: "morpheus@matrix.com", password: "theone"
      And I login as manager_user "morpheus" with password "theone"
      And I am on scoped employee_user edit page
      And I follow "Expenses"

  @wip
  Scenario: Manager User navigates to expenses
    Then I should see "Expenses for Morpheus X Fishburn"

  @wip
  Scenario: Manager User edits contact info
      And I follow "New"
    When I fill in "Date" with todays date
      And I fill in "Amount" with "$10.00"
      And I press "Save"
    Then I should see "Expense was successfully added."
      And I should see "$10.00"
      And I should see "Expenses (1)"

