class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.integer :user_id
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone1
      t.string :phone2

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
