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

class DetailsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return nil unless value == true
    details = record.send("#{attribute}_detail".to_sym)
    record.errors["#{attribute}_detail".to_sym] << "cannot be blank when #{attribute} is Yes" if details.blank?
  end
end

class Employee < ActiveRecord::Base
  belongs_to :person
  has_many :employers
  has_many :references
  has_one  :uniform_order
  has_many :employee_skills
  has_many :skills, :through => :employee_skills
  accepts_nested_attributes_for :employers, :references, :uniform_order, :skills

  validates :person_id, :presence => true, :uniqueness => true
  validates_presence_of :available_at
  validates_inclusion_of :needs_special_hours, :has_reliable_vehicle, 
    :can_travel_long_term, :been_convicted, :ever_failed_drug_test, 
    :legal_us_worker, :applied_before, :drivers_license_valid, 
    :drivers_license_ever_suspended, :agree_to_terms,
    :in => [ true, false ], :message => 'must be Yes or No'
  validates :needs_special_hours, :been_convicted, :applied_before, 
    :drivers_license_ever_suspended, :details => true
end
