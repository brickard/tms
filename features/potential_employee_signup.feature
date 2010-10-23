Feature: Sign up new potential employees from kiosk form

  As a potential employee
  I want to fill out an application
  So I can get a good job

  @wip
  Scenario: Successfull Employee Signup
    Given I am on the new applicant page
    Then I should see "Employment Application"
    When I fill in "Last name" with "Employee"
      And I fill in "First name" with "Joe"
      And I fill in "Middle name" with "The"
      And I fill in "Address" with "200 Employee Street"
      And I fill in "City" with "Birmingham"
      And I select "Alabama" from "State"
      And I fill in "Zipcode" with "35209"
      And I select "2010" from "person[date_of_birth(1i)]"
      And I select "March" from "person[date_of_birth(2i)]"
      And I select "3" from "person[date_of_birth(3i)]"
      And I fill in "Home phone" with "2055551212"
      And I fill in "Mobile phone" with "2055552121"
      And I fill in "Other phone" with "2055551515"
      And I fill in "Email" with "joe@employees.com"
      And I fill in "Email confirmation" with "joe@employees.com"
      And I press "Next"
    Then I should see "Employment Criteria"
    When I select "Yes" from "employee[needs_special_hours]"
      And I fill in "employee[needs_special_hours_detail]" with "No Weekends"
      And I select "2011" from "employee[available_at(1i)]"
      And I select "March" from "employee[available_at(2i)]"
      And I select "3" from "employee[available_at(3i)]"
      And I check "employee[has_reliable_vehicle]"
      And I check "employee[can_travel_long_term]"
      And I select "Yes" from "Have you ever been convicted of a crime"
      And I fill in "employee[been_convicted_detail]" with "Grand Theft Auto"
      And I select "No" from "Have you ever failed a drug test"
      And I select "Yes" from "Are you legally authorized to work in the United States"
      And I select "Yes" from "Have you ever applied for work or worked here before"
      And I fill in "If yes, when and reason not employed currently" with "Laid off"
      And I select "Yes" from "Do you have a valid Driver's License"
      And I select "Alabama" from "License State"
      And I fill in "License Number" with "55-5555-55555"
      And I select "2012" from "employee[drivers_license_expiration(1i)]"
      And I select "December" from "employee[drivers_license_expiration(2i)]"
      And I select "21" from "employee[drivers_license_expiration(3i)]"
      And I select "Yes" from "Has your Drivers License ever been suspended"
      And I fill in "employee[drivers_license_ever_suspended_detail]" with "Unpaid tickets"
      And I press "Next"
    Then I should see "Employment History"
    When I fill in "Company name" with "Some Job 1"
      And I select "2009" from "employer[start_date(1i)]"
      And I select "December" from "employer[start_date(2i)]"
      And I select "21" from "employer[start_date(3i)]"
      And I select "2010" from "employer[end_date(1i)]"
      And I select "December" from "employer[end_date(2i)]"
      And I select "21" from "employer[end_date(3i)]"
      And I fill in "Phone number" with "2055551111"
      And I fill in "Job Title/Description" with "Developer"
      And I fill in "Supervisor Name" with "The Super"
      And I fill in "Start $" with "$100 an hour"
      And I fill in "End $" with "$100 an hour"
      And I fill in "Reason for leaving" with "Laid off"
      And I press "Next"
    Then I should see "Some Job 1 Added"
    When I fill in "Company name" with "Some Job 2"
      And I select "2008" from "employer[start_date(1i)]"
      And I select "December" from "employer[start_date(2i)]"
      And I select "21" from "employer[start_date(3i)]"
      And I select "2009" from "employer[end_date(1i)]"
      And I select "December" from "employer[end_date(2i)]"
      And I select "21" from "employer[end_date(3i)]"
      And I fill in "Phone number" with "2055553333"
      And I fill in "Job Title/Description" with "Developer"
      And I fill in "Supervisor Name" with "The Super Duper"
      And I fill in "Start $" with "$60 an hour"
      And I fill in "End $" with "$60 an hour"
      And I fill in "Reason for leaving" with "Laid off"
      And I press "Next"
    Then I should see "Some Job 2 Added"
      And I should see "References"
    When I fill in "Name" with "Reference 1"
      And I fill in "Phone number/Email" with "2059991199"
      And I fill in "Relationship" with "Friend"
      And I press "Next"
    Then I should see "Reference 1 Added"
    When I fill in "Name" with "Reference 2"
      And I fill in "Phone number/Email" with "2059992299"
      And I fill in "Relationship" with "Friend"
      And I press "Next"
    Then I should see "Reference 2 Added"
    When I fill in "Name" with "Reference 3"
      And I fill in "Phone number/Email" with "2059993399"
      And I fill in "Relationship" with "Friend"
      And I press "Next"
    Then I should see "Reference 3 Added"
    Then I should see "ALL new employees must purchase shirts!"
      And I should see "Buy 4 get 1 free for new employees ONLY!"
      And I should see "Each shirt is $12.95"
      And I should see "If you wear a ball cap, it MUST be issued by the company!"
      And I should see "1 FREE each year"
      And I should see "Additional fitted hats can be purchased for $12.95 each"
    When I select "XL" from "Shirt Size"
      And I fill in "How many Shirts?" with "6"
      And I select "9" from "Hat Size"
      And I fill in "How many Hats?" with "2"
      And I press "Next"
    Then I should see "Authorization"
      And I should see "I certify that the facts contained"
    When I check "I Agree"
      And I fill in "Date" with "10202010"
      And I press "Apply"
    Then I should see "Your application has been submitted"
    




