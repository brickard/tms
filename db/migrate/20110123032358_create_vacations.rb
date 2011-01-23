class CreateVacations < ActiveRecord::Migration
  def self.up
    create_table :vacations do |t|
      t.integer :employee_id
      t.date :start_date
      t.date :end_date
      t.string :reason
      t.text :explanation
      t.integer :store_id
      t.boolean :approved, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :vacations
  end
end
