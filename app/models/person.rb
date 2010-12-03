# == Schema Information
# Schema version: 20101120152124
#
# Table name: people
#
#  id                              :integer         not null, primary key
#  last_name                       :string(255)
#  first_name                      :string(255)
#  middle_name                     :string(255)
#  address1                        :string(255)
#  address2                        :string(255)
#  city                            :string(255)
#  state                           :string(255)
#  zipcode                         :string(255)
#  created_at                      :datetime
#  updated_at                      :datetime
#  ssn                             :string(255)
#  home_phone                      :string(255)
#  mobile_phone                    :string(255)
#  other_phone                     :string(255)
#  hired_at                        :datetime
#  date_of_birth                   :datetime
#  application_agreement_agreed    :boolean
#  application_agreement_agreed_on :date
#  form_step                       :integer
#

class Person < ActiveRecord::Base
  has_one :user, :dependent => :destroy
  has_one :employee, :dependent => :destroy
  accepts_nested_attributes_for :user, :employee

  validates_presence_of :last_name, :first_name
  validates_presence_of :address1, :city, :state, :zipcode, :home_phone, 
    :date_of_birth, :if => lambda{ form_step_is?(1) }

  scope :applicants, lambda {  
    where( "people.hired_at IS NULL" )
  }

  scope :find_by_full_name, lambda { |full_name|
    first_name, middle_name, last_name = full_name.split(' ')
    unless last_name
      last_name = middle_name
      middle_name = ''
    end
    where( "people.last_name = ?", last_name ).
    where( "people.first_name = ?", first_name ).
    where( "people.middle_name = ?", middle_name )
  }

  scope :with_skills, lambda { |skill_ids|
    joins(:employee) & Employee.with_skills(skill_ids)
  }

  def full_name
    "#{first_name} #{middle_name+' ' rescue ''}#{last_name}"
  end

  def location
    "#{city.capitalize}, #{state.capitalize}" rescue "Unknown"
  end

  def form_step_is?(step)
    self.form_step == step.to_i
  end

  def build_user(options)
    user = User.new(options)
    user.person = self
    user.skip_confirmation!
    user
  end

end
