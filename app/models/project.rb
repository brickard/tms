# == Schema Information
# Schema version: 20101105184758
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
  has_many :shifts, :dependent => :destroy

  validates_presence_of :store_id, :name
  def display_name
    [ store.client.name, store.name, name ].join( ' | ' ) rescue ''
  end

  def create_shifts(count=3)
    shifts = (1..count.to_i).map{ |i| i.ordinalize }.inject([]) do |s, i|
      s << Shift.create!(:project => self, :name => "#{i} Shift")
    end
  end
end
