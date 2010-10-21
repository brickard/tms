class Employee < ActiveRecord::Base
  belongs_to :person
  has_many :employers
end
