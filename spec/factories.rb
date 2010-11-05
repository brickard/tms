
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

Factory.define :employer do |f|
  f.employee Employee.last || Factory.create(:employee)
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

Factory.define :employee do |f|
  f.person Factory.create(:person)
  f.needs_special_hours true
  f.needs_special_hours_detail "No Weekends"
  f.available_at "2010-10-03 11:15:20"
  f.has_reliable_vehicle true
  f.can_travel_long_term true
  f.been_convicted true
  f.been_convicted_detail "Grand Theft Auto"
  f.ever_failed_drug_test true
  f.legal_us_worker true
  f.applied_before true
  f.applied_before_detail "Worked there"
  f.drivers_license_valid true
  f.drivers_license_state "Alabama"
  f.drivers_license_number "1111-211222-11211"
  f.drivers_license_expiration "2010-10-03 11:15:20"
  f.drivers_license_ever_suspended true
  f.drivers_license_ever_suspended_detail "Unpaid parking tickets"
  f.agree_to_terms true
  f.agree_to_terms_date "2010-10-03 11:15:20"
end

Factory.define :region do |f|
  f.name Factory.next(:name)
  f.client Factory.create(:client)
  f.active true
end

Factory.define :reference do |f|
  f.employee_id 1
  f.name Factory.next(:name)
  f.contact_info Factory.next(:name)
  f.relationship Factory.next(:name)
  f.type_of_reference Factory.next(:name)
end

Factory.define :personal_reference, :class => :reference do |f|
  f.type_of_reference 'Personal'
end

Factory.define :professional_reference, :class => :reference do |f|
  f.type_of_reference 'Professional'
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
  #f.roles [ Role.find_by_name('StoreManager') || 
  #          Factory.create(:role, :name => 'StoreManager') ]
end

Factory.define :admin, :parent => :user do |f|
  #f.roles [ Role.find_by_name('Admin') || 
  #          Factory.create(:role, :name => 'Admin') ]
end

Factory.define :store do |f|
  @client = Client.last || Factory.create(:client)
  @manager = User.store_managers.last || Factory.create(:user, :roles => [ 
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
  f.employee Factory.create(:employee)
  f.shirt_size "XL"
  f.shirt_count 1
  f.hat_size "7"
  f.hat_count 1
end

Factory.define :project do |f|
  f.store Factory.create(:store)
  f.name Factory.next(:name)
end

Factory.define :shift do |f|
  f.project Factory.create(:project)
  f.name Factory.next(:name)
end

Factory.define :user_role do |f|
  f.user Factory.create(:user)
  f.role Factory.create(:role)
end

