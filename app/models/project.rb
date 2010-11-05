# == Schema Information
# Schema version: 20101028024826
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

  def display_name
    [ store.client.name, store.name, name ].join( ' | ' )
  end
end
