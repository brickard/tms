# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :accident do |f|
  f.employee { Factory.create(:employee_user) }
  f.occured_on { DateTime.now }
  f.supervisor { Factory.create(:manager_user) }
  f.store { Factory.create(:store) }
  f.description { Faker::Lorem.words }
  f.witnesses { Faker::Name.name }
  f.people_involved { Faker::Name.name }
  f.injury_location { Faker::Name.name }
  f.required_medical_care false
  f.sent_to_er false
  f.needs_further_care false
  f.miss_work false
  f.miss_work_days 2
  f.safety_procedures_followed false
  f.returning_to_work false
  f.supervisor_comments "Back soon!"
end
