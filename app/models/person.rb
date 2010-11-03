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
