Factory.define :person do |f|
  f.user { Factory.create(:user) }
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
end


