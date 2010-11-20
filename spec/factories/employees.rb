Factory.define :employee do |f|
  f.person { Factory.create(:person) }
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
end

