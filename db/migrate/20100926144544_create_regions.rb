class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.integer :client_id
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :regions
  end
end
