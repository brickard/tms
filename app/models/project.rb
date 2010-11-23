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

  def create_shifts(count=3)
    shifts = (1..count.to_i).map{ |i| i.ordinalize }.inject([]) do |s, i|
      s << Shift.find_or_create_by_name(:project => self, :name => "#{i} Shift")
    end
  end
end
