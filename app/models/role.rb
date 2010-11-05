# == Schema Information
# Schema version: 20101028024826
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
  has_many :user_roles
  has_many :users, :through => :user_roles
  validates :name, :presence => true, :uniqueness => true
end
