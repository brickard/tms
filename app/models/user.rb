class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
    :person_id, :person_attributes, :role_ids
  belongs_to :person, :dependent => :destroy
  has_many :user_roles
  has_many :roles, :through => :user_roles
  has_many :stores

  accepts_nested_attributes_for :person

  scope :store_managers, lambda{
    joins(:roles).
    where("roles.name = 'Store Manager'")
  }
  scope :admins, lambda{
    joins(:roles).
    where("roles.name = 'Admin'")
  }

  def full_name
    person.full_name rescue email
  end

end
