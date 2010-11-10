Factory.define :client do |f|
  f.name { Factory.next(:name) }
  f.active true
end

