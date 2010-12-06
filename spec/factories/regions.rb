Factory.define :region do |f|
  f.name { Factory.next(:state) }
  f.client { Factory.create(:client) }
  f.active true
end

