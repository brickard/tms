# User
Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password 'password'
  f.confirmed_at { DateTime.now }
end

Factory.define :admin, :parent => :user do |f|
  f.roles { [ Role.find_by_name('Admin') || 
            Factory.create(:role, :name => 'Admin') ] }
end

Factory.define :store_manager, :parent => :user do |f|
  f.roles { [ Role.find_by_name('StoreManager') || 
            Factory.create(:role, :name => 'StoreManager') ] }
end

