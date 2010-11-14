Feature: Sign up new potential employees from kiosk form

  As a potential employee
  I want to fill out an application
  So I can get a good job

  Scenario: Potential Employee completes the Employment Application Step 1
    Given I am on the new applicant page
    Then I should see "Employment Application"
      And I should see "You are currently on step 1 of 7"
      And I should see "Please complete the form to tell us about yourself."
    When I fill in "Last name" with "Employee"
      And I fill in "First name" with "Joe"
      And I fill in "Middle name" with "The"
      And I fill in "Address" with "200 Employee Street"
      And I fill in "City" with "Birmingham"
      And I select "Alabama" from "State"
      And I fill in "Zipcode" with "35209"
      And I fill in "Date of birth" with "01/01/1999"
      And I fill in "Home phone" with "2055551212"
      And I fill in "Mobile phone" with "2055552121"
      And I fill in "Other phone" with "2055551515"
      And I fill in "Email" with "joe@employees.com"
      And I fill in "Email confirmation" with "joe@employees.com"
      And I press "Next"
    Then I should see "Employment Criteria"
      And a person: "joe_person" should exist with first_name: "Joe", last_name: "Employee"
      And a user: "joe_user" should exist with email: "joe@employees.com"
      And user: "joe_user" should be person: "joe_person"'s user

  Scenario: Potential employee completes Employment Application Step 2
    Given the default skills exist
      And I complete step 1 of the employment application
      And I should see "Employment Criteria"
      And I should see "You are currently on step 2 of 7"
    When I select "Management" from "Skills"
      And I select "Merchandiser" from "Skills"
      And I select "Carpenter" from "Skills"
      And I select "Fixture Installer" from "Skills"
      And I select "Yes" from "applicant[employee][needs_special_hours]"
      And I fill in "applicant[employee][needs_special_hours_detail]" with "No Weekends"
      And I fill in "applicant[employee][available_at]" with "10/21/2010"
      And I select "Yes" from "applicant[employee][has_reliable_vehicle]"
      And I select "Yes" from "applicant[employee][can_travel_long_term]"
      And I select "Yes" from "Have you ever been convicted of a crime"
      And I fill in "applicant[employee][been_convicted_detail]" with "Grand Theft Auto"
      And I select "No" from "Have you ever failed a drug test"
      And I select "Yes" from "Are you legally authorized to work in the United States"
      And I select "Yes" from "Have you ever applied for work or worked here before"
      And I fill in "If yes, when and reason not employed currently" with "Laid off"
      And I select "Yes" from "Do you have a valid Drivers License"
      And I select "Alabama" from "License State"
      And I fill in "License Number" with "55-5555-55555"
      And I fill in "applicant[employee][drivers_license_expiration]" with "10/21/2013"
      And I select "Yes" from "Has your Drivers License ever been suspended"
      And I fill in "applicant[employee][drivers_license_ever_suspended_detail]" with "Unpaid tickets"
      And I press "Next"
    Then I should see "Employment History"
      And a person: "joe_person" should exist with first_name: "Joe", last_name: "Employee"
      And a user: "joe_user" should exist with email: "joe@employees.com"
      And user: "joe_user" should be person: "joe_person"'s user
      And a employee: "joe_employee" should exist with person: person "joe_person"

  Scenario: Potential employee completes Employment Application Step 3
    Given I complete step 2 of the employment application
      And I should see "Employment History"
      And I should see "You are currently on step 3 of 7"
      And I should see "You need to add at least 2 more Employers"
    When I fill in "Company name" with "Some Job 1"
      And I fill in "Start date" with "10/10/2000"
      And I fill in "End date" with "10/10/2001"
      And I fill in "Phone number" with "2055551111"
      And I fill in "Job Title/Description" with "Developer"
      And I fill in "Supervisor Name" with "The Super"
      And I fill in "Start $" with "$100 an hour"
      And I fill in "End $" with "$100 an hour"
      And I fill in "Reason for leaving" with "Laid off"
      And I press "Add"
    Then I should see "You are currently on step 3 of 7"
      And I should see "You need to add at least 1 more Employer"
      And I should see "Some Job 1"
      And a person: "joe_person" should exist with first_name: "Joe", last_name: "Employee"
      And a employee: "joe_employee" should exist with person: person "joe_person"
      And a employer should exist with employee: employee "joe_employee"
    When I press "Next"
    Then I should see "You need to add at least 1 more Employer"
    When I fill in "Company name" with "Some Job 2"
      And I fill in "Start date" with "10/10/2002"
      And I fill in "End date" with "10/10/2004"
      And I fill in "Phone number" with "2055551111"
      And I fill in "Job Title/Description" with "Developer"
      And I fill in "Supervisor Name" with "The Super"
      And I fill in "Start $" with "$100 an hour"
      And I fill in "End $" with "$100 an hour"
      And I fill in "Reason for leaving" with "Laid off"
      And I press "Add"
    Then I should see "You are currently on step 3 of 7"
      And I should see "Some Job 1"
      And I should see "Some Job 2"
      And I should not see "You need to add at least"
      And 2 employers should exist with employee: employee "joe_employee"
    When I press "Next"
      Then I should see "Employment References"

  Scenario: Potential employee completes Employment Application Step 4
    Given I complete step 3 of the employment application
      And I should see "Employment References"
      And I should see "You need to add at least 3 more References"
      And I should see "You are currently on step 4 of 7"
    When I fill in "Name" with "Reference 1"
      And I fill in "Phone number/Email" with "2059991199"
      And I fill in "Relationship" with "Friend"
      And I select "Professional" from "Type of Reference"
      And I press "Add"
    Then I should see "Employment References"
      And I should see "You need to add at least 2 more References"
      And I should see "Reference 1"
    When I press "Next"
    Then I should see "Employment References"
      And I should see "You need to add at least 2 more References"
      And I should see "Reference 1"
    When I fill in "Name" with "Reference 2"
      And I fill in "Phone number/Email" with "2059992299"
      And I fill in "Relationship" with "Friend"
      And I select "Professional" from "Type of Reference"
      And I press "Add"
    Then I should see "Employment References"
      And I should see "You need to add at least 1 more Reference"
      And I should see "Reference 1"
      And I should see "Reference 2"
    When I fill in "Name" with "Reference 3"
      And I fill in "Phone number/Email" with "2059993399"
      And I fill in "Relationship" with "Friend"
      And I select "Personal" from "Type of Reference"
      And I press "Add"
    Then I should see "Employment References"
      And I should not see "You need to add at least"
      And I should see "Reference 1"
      And I should see "Reference 2"
      And I should see "Reference 3"
    When I press "Next"
    Then I should see "ALL new employees must purchase shirts!"
  
  @wip
  Scenario: Potential employee completes Employment Application Step 5
    Given I complete step 4 of the employment application
      And I should see "You are currently on step 5 of 7"
      And I should see "ALL new employees must purchase shirts!"
      And I should see "Buy 4 get 1 free for new employees ONLY!"
      And I should see "Each shirt is $12.95"
      And I should see "If you wear a ball cap, it MUST be issued by the company!"
      And I should see "1 FREE each year"
      And I should see "Additional fitted hats can be purchased for $12.95 each"
    When I select "XL" from "Shirt Size"
      And I select "5" from "How many Shirts"
      And I select "7" from "Hat Size"
      And I select "2" from "How many Hats"
      And I press "Next"
      And show me the page
    Then I should see "Uniform Order Saved"
      And I should see "Application Agreement"

  Scenario: Potential Employee completes the Application Agreement
    Given an "Applicant"
      And an "Employee"
      And 2 "Employer"
      And 3 "Reference"
      And a "UniformOrder"
      And the last Employee belongs to the last Applicant
      And the last 2 Employers belongs to the last Applicant
      And the last 3 References belongs to the last Applicant
      And the last UniformOrder belongs to the last Applicant
      And I am on the applicant agreement page for the last applicant
      And I should see "Application Agreement"
      And I should see "You are currently on step 6 of 7"
      And I should see "I certify that the facts contained are true."
    When I check "I Agree"
      And I fill in "person[application_agreement_agreed_on]" with "10/10/2010"
      And I press "Next"
    Then I should see "Your application has been submitted"
      And I should see "Thank you for taking the time to apply"
      And I should not see "You are currently on step"
      And I should see "All steps complete!"
    
