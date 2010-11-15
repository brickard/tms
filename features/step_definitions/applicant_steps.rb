Given /^the last Employee belongs to the last Applicant$/ do
  @applicant = Person.applicants.last
  @applicant.employee = Employee.last
  @applicant.save!.should be_true
end

Given /^the last UniformOrder belongs to the last Applicant$/ do
  @applicant = Person.applicants.last
  @applicant.employee.uniform_order = UniformOrder.last
  @applicant.save!.should be_true
end

Given /^the last (\d+) Employers belongs to the last Applicant$/ do |count|
  @applicant = Person.applicants.last
  Employer.find(:all, :order => :created_at, :limit => count).each do |employer|
    @applicant.employee.employers << employer
  end
  @applicant.save!.should be_true
  @applicant.employee.employers.count.should == count.to_i
end

Given /^the last (\d+) References belongs to the last Applicant$/ do |count|
  @applicant = Person.applicants.last
  Reference.find(:all, :order => :created_at, :limit => count).each do |reference|
    @applicant.employee.references << reference
  end
  @applicant.save!.should be_true
  @applicant.employee.references.count.should == count.to_i
end

Given /^I complete step (\d+) of the employment application$/ do |step_number|
  case step_number.to_i
  when 1
    steps %Q{
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
        And there should be a "Person" whose "full_name" is "Joe The Employee"
        And there should be a "User" whose "email" is "joe@employees.com"
    }
  when 2
    steps %Q{
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
    }
  when 3
    steps %Q{
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
    }
  when 4
    steps %Q{
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
    }
  when 5
    steps %Q{
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
        And a uniform order should exist with employee: employee "joe_employee"
      Then I should see "Employment Application Agreement"
    }
  end
end

