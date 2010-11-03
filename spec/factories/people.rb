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
