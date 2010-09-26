class CreateShifts < ActiveRecord::Migration
  def self.up
    create_table :shifts do |t|
      t.integer :project_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :shifts
  end
end
