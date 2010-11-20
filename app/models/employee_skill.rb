# == Schema Information
# Schema version: 20101120152124
#
# Table name: employee_skills
#
#  id          :integer         not null, primary key
#  employee_id :integer
#  skill_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class EmployeeSkill < ActiveRecord::Base
  belongs_to :employee
  belongs_to :skill
  validates_presence_of :employee_id, :skill_id
end
