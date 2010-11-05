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
  belongs_to :employee
end
