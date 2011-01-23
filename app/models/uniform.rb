class Uniform < ActiveRecord::Base
  belongs_to :employee, :class_name => 'User'
  validate :size, :inclusion => { :in => User::SHIRT_SIZES }, :presence => true
  validate :employee_id, :count, :presence => true
end
