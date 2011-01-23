# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :vacation do |f|
  f.employee_id 1
  f.start_date "2011-01-22"
  f.end_date "2011-01-22"
  f.reason "MyString"
  f.explanation "MyText"
  f.store_id 1
end
