# == Schema Information
# Schema version: 20101028024826
#
# Table name: stores
#
#  id         :integer         not null, primary key
#  client_id  :integer
#  region_id  :integer
#  manager_id :integer
#  active     :boolean
#  name       :string(255)
#  address1   :string(255)
#  address2   :string(255)
#  city       :string(255)
#  state      :string(255)
#  zipcode    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  number     :integer
#

class Store < ActiveRecord::Base
  belongs_to :client
  belongs_to :region
  belongs_to :manager, :class_name => 'User'
  has_many :projects
  validates :name, :presence => true
  validates :client, :presence => true
  validates :region, :presence => true
  validates :manager, :presence => true # TODO: scope to StoreManager role
end
