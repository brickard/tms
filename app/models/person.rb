class Person < ActiveRecord::Base
  has_one :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
