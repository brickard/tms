# == Schema Information
# Schema version: 20101028024826
#
# Table name: clients
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Client < ActiveRecord::Base
  has_many :regions
  validates :name, :presence => true, :uniqueness => true
end
