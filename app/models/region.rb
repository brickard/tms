# == Schema Information
# Schema version: 20101120152124
#
# Table name: regions
#
#  id         :integer         not null, primary key
#  client_id  :integer
#  name       :string(255)
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Region < ActiveRecord::Base
  belongs_to :client
  validates :client_id, :presence => true
  validates :name, :presence => true
end
