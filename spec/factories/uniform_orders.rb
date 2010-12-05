Factory.define :uniform_order do |f|
  f.user { Factory.create(:user) }
  f.shirt_size { random_from(UniformOrder::SHIRT_SIZES) } 
  f.shirt_count { random_from(UniformOrder::SHIRT_COUNT) }
  f.hat_size { random_from(UniformOrder::HAT_SIZES) }
  f.hat_count { random_from(UniformOrder::HAT_COUNT) }
end

