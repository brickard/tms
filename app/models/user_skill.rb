# == Schema Information
# Schema version: 20101105184758
#
# Table name: user_skills
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  skill_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  validates_presence_of :user_id, :skill_id
end
