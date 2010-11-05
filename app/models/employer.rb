# == Schema Information
# Schema version: 20101028024826
#
# Table name: employers
#
#  id                 :integer         not null, primary key
#  employee_id        :integer
#  company_name       :string(255)
#  start_date         :date
#  end_date           :date
#  phone_number       :string(255)
#  job_title          :string(255)
#  supervisor_name    :string(255)
#  start_salary       :string(255)
#  end_salary         :string(255)
#  reason_for_leaving :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Employer < ActiveRecord::Base
  belongs_to :employee
end
