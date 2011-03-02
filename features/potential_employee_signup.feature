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
      And I fill in "Main phone" with "2055551212"
      And I fill in "Mobile phone" with "2055552121"
      And I fill in "Other phone" with "2055551515"
      And I fill in "Email" with "joe@employees.com"
      And I fill in "Email confirmation" with "joe@employees.com"
      And I press "Next"
    Then I should see "Employment Criteria"
      And user should exist with email: "joe@employees.com", form_step: "step1"

  Scenario: Potential employee completes Employment Application Step 2
    Given the default skills exist
      And I complete step 1 of the employment application
      And I should see "Employment Criteria"
      And I should see "You are currently on step 2 of 7"
    When I select "Management" from "skills"
      And I select "Merchandiser" from "skills"
      And I select "Carpenter" from "skills"
      And I select "Fixture Installer" from "skills"
      And I select "Yes" from "Are there any days, shifts, hours you will not work?"
      And I fill in "user[needs_special_hours_detail]" with "No Weekends"
      And I fill in "When are you available to start work?" with "10/21/2010"
      And I select "Yes" from "Do you have reliable transportation?"
      And I select "Yes" from "Can you travel long term?"
      And I select "Yes" from "Have you ever been convicted of a crime?"
      And I fill in "user[been_convicted_detail]" with "Grand Theft Auto"
      And I select "No" from "Have you ever failed a drug test?"
      And I select "Yes" from "Are you legally authorized to work in the United States?"
      And I select "Yes" from "Have you ever applied for work or worked here before"
      And I fill in "If yes, when and reason not employed currently?" with "Laid off"
      And I select "Yes" from "Do you have a valid Drivers License?"
      And I select "Alabama" from "License State"
      And I fill in "License Number" with "55-5555-55555"
      And I fill in "License Expiration Date" with "10/21/2013"
      And I select "Yes" from "Has your Drivers License ever been suspended?"
      And I fill in "user[drivers_license_ever_suspended_detail]" with "Unpaid tickets"
      And I fill in "Emergency Contact" with "Some Family Member"
      And I fill in "Emergency Contact Phone" with "2055551212"
      And I select "XL" from "Shirt Size"
      And I press "Next"
    Then I should see "Employment History"
      And user should exist with email: "joe@employees.com", drivers_license_state: "AL", form_step: "step2"

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
      And a employer should exist with user: applicant_user "joe_user"
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
      And 2 employers should exist with user: applicant_user "joe_user"
    When I press "Next"
    Then I should see "Employment References"
      And user should exist with email: "joe@employees.com", form_step: "step3"

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
      And a reference should exist with user: applicant_user "joe_user"
    When I fill in "Name" with "Reference 2"
      And I fill in "Phone number/Email" with "2059992299"
      And I fill in "Relationship" with "Friend"
      And I select "Professional" from "Type of Reference"
      And I press "Add"
    Then I should see "Employment References"
      And I should see "You need to add at least 1 more Reference"
      And I should see "Reference 1"
      And I should see "Reference 2"
      And 2 references should exist with user: applicant_user "joe_user"
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
      And 3 references should exist with user: applicant_user "joe_user"
    When I press "Next"
    Then I should see "Employment Application Documents"
      And user should exist with email: "joe@employees.com", form_step: "step4"
  
  Scenario: Potential employee completes Employment Application Step 5
    Given I complete step 4 of the employment application
      And I should see "Employment Application Documents"
      And I should see "You are currently on step 5 of 7"
      And I should see "Please upload scanned images of the requested documents."
    When I attach the file "features/files/rails.png" to "I9"
    And I attach the file "features/files/rails.png" to "W4"
      And I attach the file "features/files/rails.png" to "Drivers License"
      And I press "Next"
    Then I should see "Employment Application Agreement"
      And user should exist with first_name: "Joe", last_name: "Employee", form_step: "step5"
      And user's i9_image_file_name should not be nil
      And user's w4_image_file_name should not be nil
      And user's drivers_license_image_file_name should not be nil
    
  Scenario: Potential employee completes Employment Application Step 6
    Given I complete step 5 of the employment application
      And I should see "Employment Application Agreement"
      And I should see "You are currently on step 6 of 7"
      And I should see "I certify that the facts contained are true."
    When I check "I Agree"
      And I fill in "Todays Date" with "10/10/2010"
      And I press "Next"
    Then I should see "Your application has been submitted"
      And I should see "Thank you for taking the time to apply"
      And I should not see "You are currently on step"
      And I should see "All steps complete!"
      And user should exist with first_name: "Joe", last_name: "Employee", agree_to_terms: true
      And 1 email should be delivered
    
