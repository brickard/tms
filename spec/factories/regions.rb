Factory.define :region do |f|
  f.name { Factory.next(:name) }
  f.client { Factory.create(:client) }
  f.active true
end

