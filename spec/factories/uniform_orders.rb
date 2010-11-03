# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :uniform_order do |f|
  f.shirt_size "XL"
  f.shirt_count 1
  f.hat_size "7"
  f.hat_count 1
end
