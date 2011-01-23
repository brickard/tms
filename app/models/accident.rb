class Accident < ActiveRecord::Base
  belongs_to :employee, :class_name => 'User'
  belongs_to :supervisor, :class_name => 'User'
  belongs_to :store
end
