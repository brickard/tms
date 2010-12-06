Factory.define :project do |f|
  f.store { Factory.create(:store) }
  f.name { Factory.next(:project_name) }
end

