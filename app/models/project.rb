# == Schema Information
# Schema version: 20101120152124
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  store_id   :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
  belongs_to :store
  has_many :shifts

  validates_presence_of :store_id, :name
  def display_name
    [ store.client.name, store.name, name ].join( ' | ' ) rescue ''
  end
end
