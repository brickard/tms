class Person < ActiveRecord::Base
  has_one :user
  has_one :employee

  def full_name
    "#{first_name} #{middle_name+' ' rescue ''}#{last_name}"
  end
end
