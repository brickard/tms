class RemoveOldPhoneNumbersFromPerson < ActiveRecord::Migration
  def self.up
    Person.all.each do |p|
      p.update_attributes( :mobile_phone => p.phone1, :home_phone => p.phone2 )
    end
    remove_column :people, :phone1
    remove_column :people, :phone2
  end

  def self.down
    add_column :people, :phone2, :string
    add_column :people, :phone1, :string
  end
end
