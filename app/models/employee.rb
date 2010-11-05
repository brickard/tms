# == Schema Information
# Schema version: 20101028024826
#
# Table name: employees
#
#  id                                    :integer         not null, primary key
#  person_id                             :integer
#  needs_special_hours                   :boolean
#  needs_special_hours_detail            :text
#  available_at                          :datetime
#  has_reliable_vehicle                  :boolean
#  can_travel_long_term                  :boolean
#  been_convicted                        :boolean
#  been_convicted_detail                 :text
#  ever_failed_drug_test                 :boolean
#  legal_us_worker                       :boolean
#  applied_before                        :boolean
#  applied_before_detail                 :text
#  drivers_license_valid                 :boolean
#  drivers_license_state                 :string(255)
#  drivers_license_number                :string(255)
#  drivers_license_expiration            :datetime
#  drivers_license_ever_suspended        :boolean
#  drivers_license_ever_suspended_detail :text
#  agree_to_terms                        :boolean
#  agree_to_terms_date                   :datetime
#  created_at                            :datetime
#  updated_at                            :datetime
#

class Employee < ActiveRecord::Base
  belongs_to :person
  has_many :employers
  has_many :references
  has_one  :uniform_order
end
