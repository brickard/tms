# == Schema Information
# Schema version: 20101105184758
#
# Table name: stores
#
#  id         :integer         not null, primary key
#  client_id  :integer
#  region_id  :integer
#  manager_id :integer
#  number     :integer
#  active     :boolean
#  name       :string(255)
#  address1   :string(255)
#  address2   :string(255)
#  city       :string(255)
#  state      :string(255)
#  zipcode    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Store < ActiveRecord::Base
  belongs_to :client
  belongs_to :region
  belongs_to :manager, :class_name => 'User'
  has_many :projects, :dependent => :destroy
  has_many :disciplines
  has_many :accidents
  validates :name, :presence => true
  validates :client, :presence => true
  validates :region, :presence => true
  validates :manager_id, :presence => true

  def name_and_number
    return self.name unless self.number
    "#{self.name} #{self.number}"
  end
end
