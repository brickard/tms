class Store < ActiveRecord::Base
  belongs_to :client
  belongs_to :region
  belongs_to :manager, :class_name => 'User'
end
