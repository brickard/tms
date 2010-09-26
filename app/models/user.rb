class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  belongs_to :person
  has_many :user_roles
  has_many :roles, :through => :user_roles
  has_many :stores

  scope :managers, lambda{
    joins(:roles).
    where("roles.name = 'manager'")
  }
  scope :admins, lambda{
    joins(:roles).
    where("roles.name = 'admin'")
  }

  def full_name
    person.full_name rescue email
  end
end
