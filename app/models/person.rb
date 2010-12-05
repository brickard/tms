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
  belongs_to :user

  validates_presence_of :last_name, :first_name, :user_id
  validates_presence_of :address1, :city, :state, :zipcode, :home_phone, 
    :date_of_birth, :if => lambda{ self.applicant? == true }

  User::ROLES.each do |role_name|
    delegate "#{role_name}?".to_sym, :to => :user
  end

  def full_name
    "#{first_name} #{middle_name+' ' rescue ''}#{last_name}"
  end

  def location
    "#{city.capitalize}, #{state.capitalize} #{zipcode}" rescue "Unknown"
  end

  def form_step_is?(step)
    self.form_step == step.to_i
  end

end
