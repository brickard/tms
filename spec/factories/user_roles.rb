Factory.define :user_role do |f|
  f.user { Factory.create(:user) }
  f.role { Factory.create(:role) }
end
