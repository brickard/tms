Feature: Employee Expenses

  As an manager
  I want to manage employee expenses

  Background: Manager and Employee Users Exists and Manager is logged in
    Given an employee_user "employee" exists with first_name: "Morpheus", middle_name: "X", last_name: "Fishburn"
      And a manager_user "morpheus" exists with email: "morpheus@matrix.com", password: "theone"
      And I login as manager_user "morpheus" with password "theone"
      And I am on scoped employee_user edit page
      And I follow "Expenses"

  Scenario: Manager User navigates to expenses
    Then I should see "Expenses for Morpheus X Fishburn"

  Scenario: Manager User adds expense
    Given I follow "New"
      Then I should see "New Expense for Morpheus X Fishburn"
      And I should see "Expenses (0)"
    When I fill in "Date" with "2011-01-22"
      And I fill in "Amount" with "$10.00"
      And I fill in "Description" with "Lunch with Client"
      And I press "Save"
    Then I should see "Expense was successfully added."
      And I should see "$10.00"
      And I should see "Lunch with Client"
      And I should see "Expenses (1)"

  Scenario: Manager User edits expense
    Given an expense exists with employee: employee_user "employee", amount: "$20.00"
      And I follow "Expenses"
      And I follow "Edit"
      And I should see "Expenses (1)"
    When I fill in "Description" with "Lunch with Neo"
      And I press "Save"
    Then I should see "Expense was successfully updated."
      And I should see "Lunch with Neo"
      And I should see "Expenses (1)"

  @javascript
  Scenario: Manager User edits expense
    Given an expense exists with employee: employee_user "employee", amount: "$20.00"
      And I follow "Expenses"
    When I follow "Delete" and click OK
    Then I should see "Expense was successfully deleted."
      And I should see "Expenses (0)"

