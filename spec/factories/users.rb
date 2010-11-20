# User
Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password 'password'
  f.confirmed_at { DateTime.now }
end

Factory.define :admin, :parent => :user do |f|
  f.admin true
end

Factory.define :store_manager, :parent => :user do |f|
  f.admin false
end

