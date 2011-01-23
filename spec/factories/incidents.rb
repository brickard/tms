# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :incident do |f|
  f.employee { Factory.create(:employee_user) }
  f.supervisor { Factory.create(:manager_user) }
  f.occured_on { Date.today }
  f.people_involved { Faker::Name.name }
  f.store { Factory.create(:store) }
  f.witnesses { Faker::Name.name }
  f.description { Faker::Lorem.words }
end
