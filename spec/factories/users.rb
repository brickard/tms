Factory.define :user do |f|
  f.email { Faker::Internet.email }
  f.password { random_chars }
  f.role 'admin'
  f.last_name { Faker::Name.last_name }
  f.first_name { Faker::Name.first_name }
  f.middle_name { Faker::Name.first_name }
  f.address1 { Faker::Address.street_address }
  f.address2 { Faker::Address.secondary_address }
  f.city { Faker::Address.city }
  f.state { Faker::Address.us_state_abbr }
  f.zipcode { Faker::Address.zip_code }
  f.ssn { Factory.next(:ssn) }
  f.home_phone { Faker::PhoneNumber.short_phone_number }
  f.mobile_phone { Faker::PhoneNumber.short_phone_number }
  f.other_phone { Faker::PhoneNumber.short_phone_number }
  f.hired_at nil
  f.date_of_birth { Factory.next(:birth_date) }
  f.needs_special_hours { Factory.next(:boolean) }
  f.needs_special_hours_detail { Faker::Lorem.words }
  f.available_at { Factory.next(:future_date) }
  f.has_reliable_vehicle { Factory.next(:boolean) }
  f.can_travel_long_term { Factory.next(:boolean) }
  f.been_convicted { Factory.next(:boolean) }
  f.been_convicted_detail { Faker::Lorem.words }
  f.ever_failed_drug_test { Factory.next(:boolean) }
  f.legal_us_worker { Factory.next(:boolean) }
  f.applied_before { Factory.next(:boolean) }
  f.applied_before_detail { Faker::Lorem.words }
  f.drivers_license_valid { Factory.next(:boolean) }
  f.drivers_license_state { Factory.next(:state) }
  f.drivers_license_number { Factory.next(:drivers_license_number) }
  f.drivers_license_expiration { Factory.next(:future_date) }
  f.drivers_license_ever_suspended { Factory.next(:boolean) }
  f.drivers_license_ever_suspended_detail { Faker::Lorem.words }
  f.agree_to_terms { Factory.next(:boolean) }
  f.agree_to_terms_date { Factory.next(:future_date) }
  f.emergency_contact_name { Faker::Name.name }
  f.emergency_contact_phone { Faker::PhoneNumber.short_phone_number }
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
  f.hired_at { Factory.next(:future_date) }
end

Factory.define :employee_user, :parent => :user do |f|
  f.role 'employee'
  f.hired_at { Factory.next(:future_date) }
end

Factory.define :applicant_user, :parent => :user do |f|
  f.role 'applicant'
end

