Factory.define :role do |f|
  f.name { Factory.next(:name) }
end

Factory.define :admin_role, :parent => :role do |f|
  f.name 'Admin'
end

Factory.define :manager_role, :parent => :role do |f|
  f.name 'StoreManager'
end

