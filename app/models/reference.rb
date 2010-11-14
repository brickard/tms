# == Schema Information
# Schema version: 20101028024826
#
# Table name: references
#
#  id                :integer         not null, primary key
#  employee_id       :integer
#  name              :string(255)
#  contact_info      :string(255)
#  relationship      :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  type_of_reference :string(255)
#

class Reference < ActiveRecord::Base
  REFERENCE_TYPES = [ 'Professional', 'Personal' ]
  belongs_to :employee
  validates_presence_of :employee_id, :name, :contact_info, :relationship, 
    :type_of_reference
end
