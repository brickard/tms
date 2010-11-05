# == Schema Information
# Schema version: 20101028024826
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
#

class Person < ActiveRecord::Base
  has_one :user
  has_one :employee

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

  def full_name
    "#{first_name} #{middle_name+' ' rescue ''}#{last_name}"
  end
end
