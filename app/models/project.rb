class Project < ActiveRecord::Base
  belongs_to :store
  has_many :shifts
end
