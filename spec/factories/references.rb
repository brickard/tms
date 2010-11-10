Factory.define :reference do |f|
  f.employee { Factory.create(:employee) }
  f.name { Factory.next(:name) }
  f.contact_info { Factory.next(:name) }
  f.relationship { Factory.next(:name) }
  f.type_of_reference { Factory.next(:name) }
end

Factory.define :personal_reference, :parent => :reference do |f|
  f.type_of_reference 'Personal'
end

Factory.define :professional_reference, :parent => :reference do |f|
  f.type_of_reference 'Professional'
end

