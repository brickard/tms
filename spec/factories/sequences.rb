def random_from(data)
  raise "random_from input must respond to size" unless data.respond_to?(:size)
  raise "random_from input must respond to []" unless data.respond_to?(:[])
  return data[rand(data.size)]
end

def random_chars(count=10, lower = true, upper = true)
  chars = []
  chars += ('a'..'z').to_a if lower
  chars += ('A'..'Z').to_a if upper
  count.to_i.times.map { chars[rand(chars.length)] }.join
end

def random_numbers(count=10)
  count.to_i.times.map { rand(9) }.join
end

def random_date(future=true, years=1)
  operand = future == true ? '+' : '-'
  year = eval("Time.now.year #{operand} rand(years) #{operand} 1")
  month = rand(12) + 1
  day = rand(31) + 1
  Time.local(year, month, day).to_date
end

Factory.sequence(:name) { Faker::Company.name }
Factory.sequence(:email) { Faker::Internet.email }
Factory.sequence(:first_name) { Faker::Name.first_name }
Factory.sequence(:last_name) { Faker::Name.last_name }
Factory.sequence(:middle_name) { Faker::Name.first_name }
Factory.sequence(:address1) { Faker::Address.street_address }
Factory.sequence(:address2) { Faker::Address.secondary_address }
Factory.sequence(:state) { Carmen::US_STATES[rand(Carmen::US_STATES.size)][1] }
Factory.sequence(:phone) { Faker::PhoneNumber.phone_number }
Factory.sequence(:boolean) { [ true, false ][rand(2)] }
Factory.sequence(:drivers_license_number) { "#{random_numbers(4)}-#{random_numbers(5)}-#{random_numbers(3)}" }
Factory.sequence(:ssn) { "#{random_numbers(3)}-#{random_numbers(2)}-#{random_numbers(4)}" }
Factory.sequence(:future_date) { random_date }
Factory.sequence(:past_date) { random_date(false) }
Factory.sequence(:birth_date) { random_date(false, 60) }
Factory.sequence(:project_name) { "Project #{random_numbers(6)}" }
Factory.sequence(:store_name) { "Store #{random_numbers(6)}" }

