# == Schema Information
# Schema version: 20101120152124
#
# Table name: shifts
#
#  id         :integer         not null, primary key
#  project_id :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Shift < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :project_id, :name
end
