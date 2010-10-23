# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :uniform_order do |f|
  f.employee_id 1
  f.shirt_size "MyString"
  f.shirt_count 1
  f.hat_size "MyString"
  f.hat_count 1
end
