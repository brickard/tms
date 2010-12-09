# == Schema Information
# Schema version: 20101105184758
#
# Table name: skills
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Skill < ActiveRecord::Base
  has_many :user_skills
  has_many :users, :through => :user_skills
  validates :name, :presence => true
end
