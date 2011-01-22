# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :expense do |f|
  f.submitted_at Date.today
  f.amount { rand(100) }
  f.employee { Factory.create(:employee_user) }
  f.description { Faker::Lorem.words }
end
