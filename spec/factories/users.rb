# User
Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password 'password'
  f.password_confirmation 'password'
  f.role 'admin'
end

Factory.define :admin_user, :parent => :user do |f|
  f.role 'admin'
end

Factory.define :manager_user, :parent => :user do |f|
  f.role 'manager'
end

Factory.define :employee_user, :parent => :user do |f|
  f.role 'employee'
end

Factory.define :applicant_user, :parent => :user do |f|
  f.role 'applicant'
end

