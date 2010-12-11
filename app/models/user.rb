# == Schema Information
# Schema version: 20101105184758
#
# Table name: users
#
#  id                                    :integer         not null, primary key
#  email                                 :string(255)     default(""), not null
#  encrypted_password                    :string(128)     default(""), not null
#  password_salt                         :string(255)     default(""), not null
#  reset_password_token                  :string(255)
#  remember_token                        :string(255)
#  remember_created_at                   :datetime
#  sign_in_count                         :integer         default(0)
#  current_sign_in_at                    :datetime
#  last_sign_in_at                       :datetime
#  current_sign_in_ip                    :string(255)
#  last_sign_in_ip                       :string(255)
#  failed_attempts                       :integer         default(0)
#  unlock_token                          :string(255)
#  locked_at                             :datetime
#  role                                  :string(255)
#  form_step                             :string(255)     default("step0")
#  last_name                             :string(255)
#  first_name                            :string(255)
#  middle_name                           :string(255)
#  address1                              :string(255)
#  address2                              :string(255)
#  city                                  :string(255)
#  state                                 :string(255)
#  zipcode                               :string(255)
#  home_phone                            :string(255)
#  mobile_phone                          :string(255)
#  other_phone                           :string(255)
#  ssn                                   :string(255)
#  date_of_birth                         :string(255)
#  hired_at                              :date
#  needs_special_hours                   :boolean
#  needs_special_hours_detail            :text
#  available_at                          :date
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
#  drivers_license_expiration            :date
#  drivers_license_ever_suspended        :boolean
#  drivers_license_ever_suspended_detail :text
#  agree_to_terms                        :boolean
#  agree_to_terms_date                   :date
#  emergency_contact_name                :string(255)
#  emergency_contact_phone               :string(255)
#  shirt_size                            :string(255)
#  shirt_count                           :integer
#  hat_size                              :string(255)
#  hat_count                             :integer
#  shift_id                              :integer
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

require 'lib/model_behaviors/roles'

class User < ActiveRecord::Base
  include ::ModelBehaviors::RolesBehavior
  HAT_SIZES   = %{ S M L }
  SHIRT_SIZES = %{ S M L XL XXL XXXL XXXXL }
  HAT_COUNT   = (1..10).to_a
  SHIRT_COUNT = (1..10).to_a
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  has_many :employers, :dependent => :destroy
  has_many :references, :dependent => :destroy
  has_many :user_skills, :dependent => :destroy
  has_many :skills, :through => :user_skills
  has_many :stores, :foreign_key => :manager_id
  belongs_to :shift

  accepts_nested_attributes_for :employers, :references, :user_skills, :skills, :shift

  # column based attributes
  attr_accessible :email, :role, :form_step, :last_name, :first_name,
    :middle_name, :address1, :address2, :city, :state, :zipcode,
    :home_phone, :mobile_phone, :other_phone, :ssn, :date_of_birth,
    :hired_at, :agree_to_terms, :agree_to_terms_date,
    :needs_special_hours, :needs_special_hours_detail, :available_at,
    :has_reliable_vehicle, :can_travel_long_term, :been_convicted,
    :been_convicted_detail, :ever_failed_drug_test, :legal_us_worker,
    :applied_before, :applied_before_detail, :drivers_license_valid,
    :drivers_license_state, :drivers_license_number, 
    :drivers_license_expiration, :drivers_license_ever_suspended,
    :drivers_license_ever_suspended_detail,
    :emergency_contact_name, :emergency_contact_phone,
    :shirt_size, :shirt_count, :hat_size, :hat_count, :shift_id
  
  # virtual attributes
  attr_accessible :email_confirmation, :remember_me, :password, 
    :password_confirmation

  # nested attributes
  attr_accessible :employers_attributes, :references_attributes, 
    :user_skills_attributes, :skill_ids, :employers, :references

  before_validation :set_random_password!, :set_random_email!, :set_default_role!
  validates :email, :presence => true, :confirmation => true, :uniqueness => true
  validates :last_name, :first_name, :presence => true


  scope :with_role,      lambda { |role_name| where(:role => role_name)  }
  scope :admins,         lambda { User.with_role('admin') }
  scope :managers,       lambda { User.with_role('manager') }
  scope :employees,      lambda { User.with_role('employee') }
  scope :applicants,     lambda { User.with_role('applicant') }
  scope :on_shift,       lambda { |shift| where(:shift_id => shift.id) }
  scope :idle_employees, lambda { User.employees.where(:shift_id => nil) }

  state_machine :form_step, :initial => :step0 do

    event :increment_step do
      transition :step0 => :step1, :step1 => :step2, :step2 => :step3, 
        :step3 => :step4, :step4 => :step5, :step5 => :step6,
        :step6 => :step7
    end
    event :decrement_step do
      transition :step7 => :step6, :step6 => :step5, :step5 => :step4, 
        :step4 => :step3, :step3 => :step2, :step2 => :step1,
        :step1 => :step0
    end

    state :step1 do
      validates :address1, :city, :zipcode, :home_phone, :date_of_birth, :state,
        :presence => true
    end

    state :step2 do
      validates :address1, :city, :zipcode, :home_phone, :date_of_birth, :state,
        :presence => true
      validates_presence_of :available_at, :emergency_contact_name, 
        :emergency_contact_phone
      validates_inclusion_of :needs_special_hours, :has_reliable_vehicle, 
        :can_travel_long_term, :been_convicted, :ever_failed_drug_test, 
        :legal_us_worker, :applied_before, :drivers_license_valid, 
        :in => [ true, false ], :message => 'must be Yes or No'
      validates :needs_special_hours, :been_convicted, :applied_before, 
        :drivers_license_ever_suspended, :details => true
    end

    state :step5 do
      validates :hat_count, :hat_size, :shirt_count, :shirt_size, :presence => true
    end

    state :step6 do
      validates :agree_to_terms, :agree_to_terms_date, :presence => true
      validates :agree_to_terms, :inclusion => { :in => [ true ] }
    end
  end

  def full_name
    "#{first_name} #{middle_name+' ' rescue ''}#{last_name}"
  end

  def location
    "#{city.capitalize}, #{state.capitalize} #{zipcode}" rescue "Unknown"
  end

  def display_phones
    %w{ email home_phone mobile_phone other_phone }.inject([]) do |a, p|
      value = self.send(p.to_sym)
      next if value.blank?
      a << "#{p.first.upcase}: #{value}"
    end.join(" | ")
  end

  def form_step_to_i
    self.form_step.to_s.last.to_i
  end

  def increment_form_step
    next_form_step = "step#{(self.form_step.to_s.last.to_i + 1)}"
    self.form_step = next_form_step
  end

  def decrement_form_step
    prev_form_step = "step#{(self.form_step.to_s.last.to_i - 1)}"
    self.form_step = prev_form_step
  end

  def set_random_password!
    return nil unless self.password.blank?
    self.password = ActiveSupport::SecureRandom.hex(10)
    self.password_confirmation = self.password
  end

  def set_random_email!
    return nil unless self.email.blank?
    self.email = "#{ActiveSupport::SecureRandom.hex(2)}@localhost.localdomain"
    self.email_confirmation = self.email
  end

  def set_default_role!
    return nil unless self.role.blank?
    self.role = 'applicant'
  end

  def hire!
    self.role = 'employee'
    self.hired_at = Date.today
    self.save!
  end

end
