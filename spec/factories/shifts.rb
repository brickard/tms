Factory.define :shift do |f|
  f.project { Factory.create(:project) }
  f.name { Factory.next(:name) }
end

