Factory.define :reference do |f|
  f.user { Factory.create(:user) }
  f.name { Faker::Name.name }
  f.contact_info { Faker::PhoneNumber.phone_number }
  f.relationship { Faker::Lorem.words(2) }
  f.type_of_reference { Reference::REFERENCE_TYPES[rand(Reference::REFERENCE_TYPES.size)] }
end

Factory.define :personal_reference, :parent => :reference do |f|
  f.type_of_reference 'Personal'
end

Factory.define :professional_reference, :parent => :reference do |f|
  f.type_of_reference 'Professional'
end

