Factory.define :employer do |f|
  f.user { Factory.create(:user) }
  f.company_name { Faker::Company.name }
  f.start_date "2010-10-20"
  f.end_date "2010-10-20"
  f.phone_number { Faker::PhoneNumber.phone_number }
  f.job_title { Faker::Company.catch_phrase }
  f.supervisor_name { Faker::Name.name }
  f.start_salary "$1000.00 per month"
  f.end_salary "1000.00 per month"
  f.reason_for_leaving { Faker::Company.bs }
end


