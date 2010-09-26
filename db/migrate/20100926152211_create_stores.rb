class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.integer :client_id
      t.integer :region_id
      t.integer :manager_id
      t.boolean :active
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
