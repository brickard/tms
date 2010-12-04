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
         :confirmable, :lockable, :timeoutable

  attr_accessible :email, :email_confirmation, :password, 
    :password_confirmation, :remember_me, :person_id, :person_attributes, 
    :role
  belongs_to :person, :dependent => :destroy
  has_many :stores
  accepts_nested_attributes_for :person, :stores

  validates :email, :presence => true, :confirmation => true, :uniqueness => true

  before_validation :set_random_password!, :set_random_email!

  scope :store_managers, lambda {
    where(
      arel_table[:admin].eq(false).or(
      arel_table[:admin].eq(nil))
    ).
    joins(:person).
      where(
          Person.arel_table[:hired_at].not_eq(nil)
      )
  }
  scope :role_is, lambda { |role_name| where(:role => role_name)  }
  scope :admins, lambda { where(:admin => true) }

  scope :not_applicants, lambda{
    joins(:person).
    where('people.hired_at IS NOT NULL')
  }

  def full_name
    person.full_name rescue email
  end

  def set_random_password!
    self.password = ActiveSupport::SecureRandom.hex(10) if self.password.blank?
  end

  def set_random_email!
    return nil unless self.email.blank?
    self.email = "#{ActiveSupport::SecureRandom.hex(2)}@localhost.localdomain"
    self.email_confirmation = self.email
    self.skip_confirmation! rescue nil
  end

end
