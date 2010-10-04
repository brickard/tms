# Read about factories at http://github.com/thoughtbot/factory_girl

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
