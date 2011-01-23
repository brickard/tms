class Vacation < ActiveRecord::Base
  REASONS = [ 'Personal', 'Sick', 'Family Medical', 'Jury Duty', 'Military',
              'Funeral', 'Short Term Disability' ]
  belongs_to :employee, :class_name => 'User'
end
