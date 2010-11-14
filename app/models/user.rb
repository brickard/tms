# == Schema Information
# Schema version: 20101028024826
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
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  attr_accessible :email, :email_confirmation, :password, 
    :password_confirmation, :remember_me, :person_id, :person_attributes, 
    :role_ids
  belongs_to :person, :dependent => :destroy
  has_many :user_roles
  has_many :roles, :through => :user_roles
  has_many :stores
  accepts_nested_attributes_for :person, :roles, :stores

  validates :email, :presence => true, :confirmation => true, :uniqueness => true

  before_validation :ensure_password_is_set

  scope :store_managers, lambda{
    joins(:roles).
    where("roles.name = 'StoreManager'")
  }
  scope :admins, lambda{
    joins(:roles).
    where("roles.name = 'Admin'")
  }
  scope :not_applicants, lambda{
    joins(:person).
    where('people.hired_at IS NOT NULL')
  }

  def full_name
    person.full_name rescue email
  end

  private
  def ensure_password_is_set
    self.password = ActiveSupport::SecureRandom.hex(10) if self.password.blank?
  end

end
