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
  Time.local(year, month, day)
end

Factory.sequence(:name) { random_chars }
Factory.sequence(:email) { random_chars + '@matrix.com' }
Factory.sequence(:first_name) { "Neo#{random_chars}" }
Factory.sequence(:last_name) { "Neo#{random_chars}" }
Factory.sequence(:middle_name) { "Neo#{random_chars}" }
Factory.sequence(:address1) { "#{random_numbers(4)} White Rabbit Lane" }
Factory.sequence(:address2) { "Suite #{random_numbers(4)}" }
Factory.sequence(:state) { Carmen::US_STATES[rand(Carmen::US_STATES.size)] }
Factory.sequence(:phone) { random_numbers(10) }
Factory.sequence(:boolean) { [ true, false ][rand(2)] }
Factory.sequence(:drivers_license_number) { "#{random_numbers(4)}-#{random_numbers(5)}-#{random_numbers(3)}" }
Factory.sequence(:ssn) { "#{random_numbers(3)}-#{random_numbers(2)}-#{random_numbers(4)}" }
Factory.sequence(:future_date) { random_date }
Factory.sequence(:past_date) { random_date(false) }
Factory.sequence(:birth_date) { random_date(false, 60) }
