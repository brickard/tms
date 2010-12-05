# User
Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password 'password'
  f.password_confirmation 'password'
  f.role 'admin'
  f.last_name { Faker::Name.last_name }
  f.first_name { Faker::Name.first_name }
  f.middle_name { Factory.next(:middle_name) }
  f.address1 { Faker::Address.street_address }
  f.address2 { Faker::Address.secondary_address }
  f.city { Faker::Address.city }
  f.state { Faker::Address.us_state_abbr }
  f.zipcode { Faker::Address.zip_code }
  f.ssn '111-11-1111'
  f.home_phone { Faker::PhoneNumber.phone_number }
  f.mobile_phone { Faker::PhoneNumber.phone_number }
  f.other_phone { Faker::PhoneNumber.phone_number }
  f.hired_at DateTime.now
  f.date_of_birth DateTime.now - 33.years
  f.application_agreement_agreed true
  f.application_agreement_agreed_on DateTime.now
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
  f.emergency_contact_name 'Your Mom!'
  f.emergency_contact_phone '2055551212'
  f.shirt_size { random_from(User::SHIRT_SIZES) } 
  f.shirt_count { random_from(User::SHIRT_COUNT) }
  f.hat_size { random_from(User::HAT_SIZES) }
  f.hat_count { random_from(User::HAT_COUNT) }
end

Factory.define :admin_user, :parent => :user do |f|
  f.role 'admin'
end

Factory.define :manager_user, :parent => :user do |f|
  f.role 'manager'
end

Factory.define :employee_user, :parent => :user do |f|
  f.role 'employee'
end

Factory.define :applicant_user, :parent => :user do |f|
  f.role 'applicant'
end

