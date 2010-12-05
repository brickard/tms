# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user_skill do |f|
  f.user  { Factory.create(:user) }
  f.skill { Factory.create(:skill) }
end
