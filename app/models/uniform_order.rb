# == Schema Information
# Schema version: 20101120152124
#
# Table name: uniform_orders
#
#  id          :integer         not null, primary key
#  employee_id :integer
#  shirt_size  :string(255)
#  shirt_count :integer
#  hat_size    :string(255)
#  hat_count   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class UniformOrder < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :presence => true, :uniqueness => true
  validates_presence_of :shirt_size, :shirt_count, :hat_size, :hat_count
end
