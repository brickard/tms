def random_chars(count=10)
  chars = ('a'..'z').to_a + ('A'..'Z').to_a
  count.to_i.times.map { chars[rand(chars.length)] }.join
end

