
Factory.sequence(:name) do
  random_chars
end

Factory.sequence(:email) do
  random_chars + '@matrix.com'
end
Factory.sequence(:first_name) { "Neo#{Time.now.to_i}" }
Factory.sequence(:last_name) { "Neo#{Time.now.to_i}" }
Factory.sequence(:middle_name) { "Neo#{Time.now.to_i}" }
Factory.sequence(:address1) { 
  "#{Time.now.to_i} White Rabbit Lane" 
}
Factory.sequence(:address2) { "Suite #{Time.now.to_i}" }
Factory.sequence(:phone) { 
  "205555#{Time.now.to_i.to_s[-4..-1]}" 
}
Factory.define :client do |f|
  f.name Factory.next(:name)
  f.active true
end

Factory.define :employee do |f|
  f.person_id 1
  f.needs_special_hours false
  f.needs_special_hours_detail "MyText"
  f.available_at "2010-10-03 11:15:20"
  f.has_reliable_vehicle false
  f.can_travel_long_term false
  f.been_convicted false
  f.been_convicted_detail "MyText"
  f.ever_failed_drug_test false
  f.legal_us_worker false
  f.applied_before ""
  f.applied_before_detail "MyText"
  f.drivers_license_valid false
  f.drivers_license_state "MyString"
  f.drivers_license_number "MyString"
  f.drivers_license_expiration "2010-10-03 11:15:20"
  f.drivers_license_ever_suspended false
  f.drivers_license_ever_suspended_detail "MyText"
  f.agree_to_terms false
  f.agree_to_terms_date "2010-10-03 11:15:20"
end

Factory.define :employer do |f|
  f.employee_id 1
  f.company_name "MyString"
  f.start_date "2010-10-20"
  f.end_date "2010-10-20"
  f.phone_number "MyString"
  f.job_title "MyString"
  f.supervisor_name "MyString"
  f.start_salary "MyString"
  f.end_salary "MyString"
  f.reason_for_leaving "MyString"
end


Factory.define :person do |f|
  f.last_name Factory.next(:last_name)
  f.first_name Factory.next(:first_name)
  f.middle_name Factory.next(:middle_name)
  f.address1 Factory.next(:address1)
  f.address2 Factory.next(:address2)
  f.city 'Loi'
  f.state 'Alabama'
  f.zipcode '35216'
  f.ssn '111-11-1111'
  f.home_phone Factory.next(:phone)
  f.mobile_phone Factory.next(:phone)
  f.other_phone Factory.next(:phone)
  f.hired_at DateTime.now
  f.date_of_birth DateTime.now - 33.years
  f.application_agreement_agreed true
  f.application_agreement_agreed_on DateTime.now
end

Factory.define(:applicant, :class => :person) do |f|
  f.hired_at nil
end

Factory.define :region do |f|
  f.name Factory.next(:name)
  f.client Factory.create(:client)
  f.active true
end

Factory.define :reference do |f|
  f.employee_id 1
  f.name "MyString"
  f.contact_info "MyString"
  f.relationship "MyString"
end

Factory.define :role do |f|
  f.name 'Role1'
end

Factory.define :admin_role, :parent => :role do |f|
  f.name 'Admin'
end

Factory.define :manager_role, :parent => :role do |f|
  f.name 'StoreManager'
end

# User
Factory.define :user do |f|
  f.email Factory.next(:email)
  f.password 'password'
  f.password_confirmation 'password'
  f.roles [ Factory.create(:role, :name => 'StoreManager') ]
end

Factory.define :admin, :parent => :user do |f|
  f.roles [ Factory.create(:role, :name => 'Admin') ]
end

Factory.define :store do |f|
  @client = Factory.create(:client)
  @manager = Factory.create(:user, :roles => [ 
    Factory.create(:manager_role),
  ])
  f.client @client
  f.region Factory.create(:region, :client => @client)
  f.manager @manager
  f.active true
  f.name Factory.next(:name)
  f.address1 Factory.next(:address1)
  f.address2 Factory.next(:address2)
  f.city 'Zion'
  f.zipcode '35216'
end

Factory.define :uniform_order do |f|
  f.shirt_size "XL"
  f.shirt_count 1
  f.hat_size "7"
  f.hat_count 1
end

