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
      t.string :home_phone
      t.string :mobile_phone
      t.string :other_phone
      t.string :phone2
      t.string :ssn
      t.string :date_of_birth
      t.date   :hired_at

      t.boolean :application_agreement_agreed
      t.boolean :application_agreement_agreed_on
      t.integer :form_step

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
