# == Schema Information
# Schema version: 20101120152124
#
# Table name: skills
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Skill < ActiveRecord::Base
  has_many :employee_skills
  has_many :employees, :through => :employee_skills
  validates :name, :presence => true
end
