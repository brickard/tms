# == Schema Information
# Schema version: 20101120152124
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  confirmation_token   :string(255)
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  failed_attempts      :integer         default(0)
#  unlock_token         :string(255)
#  locked_at            :datetime
#  created_at           :datetime
#  updated_at           :datetime
#  person_id            :integer
#  admin                :boolean
#

class User < ActiveRecord::Base
  include ModelBehaviors::RolesBehavior
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  attr_accessible :email, :email_confirmation, :password, 
    :password_confirmation, :remember_me, :person_attributes, 
    :role
  has_one :person, :dependent => :destroy
  has_one :employee, :dependent => :destroy
  has_one :uniform_order, :dependent => :destroy

  has_many :employers, :dependent => :destroy
  has_many :references, :dependent => :destroy
  has_many :user_skills, :dependent => :destroy
  has_many :skills, :through => :user_skills

  has_many :stores, :foreign_key => :manager_id

  accepts_nested_attributes_for :person, :employee, :employers, :references, 
    :uniform_order, :skills

  validates :email, :presence => true, :confirmation => true, :uniqueness => true

  before_validation :set_random_password!, :set_random_email!, :set_default_role!

  #scope :with_role, lambda { |role_name| where(:role => role_name)  }
  #scope :admins, User.with_role('admin')
  #scope :admins, User.with_role('admin')

  def full_name
    person.full_name rescue email
  end

  def set_random_password!
    self.password = ActiveSupport::SecureRandom.hex(10) if self.password.blank?
    self.password_confirmation = self.password
  end

  def set_random_email!
    return nil unless self.email.blank?
    self.email = "#{ActiveSupport::SecureRandom.hex(2)}@localhost.localdomain"
    self.email_confirmation = self.email
    self.skip_confirmation!
  end

  def set_default_role!
    return nil unless self.role.blank?
    self.role = 'applicant'
  end

end
