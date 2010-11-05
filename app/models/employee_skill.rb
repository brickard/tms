class EmployeeSkill < ActiveRecord::Base
  belongs_to :employee
  belongs_to :skill
  validates_presence_of :employee_id, :skill_id
end
