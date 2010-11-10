Factory.define :employer do |f|
  f.employee { Factory.create(:employee) }
  f.company_name "MyString"
  f.start_date "2010-10-20"
  f.end_date "2010-10-20"
  f.phone_number "MyString"
  f.job_title "MyString"
  f.supervisor_name "MyString"
  f.start_salary "MyString"
  f.end_salary "MyString"
  f.reason_for_leaving "MyString"
end


