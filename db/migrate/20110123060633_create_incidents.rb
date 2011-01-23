class CreateIncidents < ActiveRecord::Migration
  def self.up
    create_table :incidents do |t|
      t.integer :employee_id
      t.integer :supervisor_id
      t.date :occured_on
      t.string :people_involved
      t.integer :store_id
      t.string :witnesses
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :incidents
  end
end
