class CreateAccidents < ActiveRecord::Migration
  def self.up
    create_table :accidents do |t|
      t.integer :employee_id
      t.datetime :occured_on
      t.integer :supervisor_id
      t.integer :store_id
      t.text :description
      t.string :witnesses
      t.string :people_involved
      t.string :injury_location
      t.boolean :required_medical_care
      t.boolean :sent_to_er
      t.boolean :needs_further_care
      t.boolean :miss_work
      t.integer :miss_work_days
      t.boolean :safety_procedures_followed
      t.boolean :returning_to_work
      t.text :supervisor_comments

      t.timestamps
    end
  end

  def self.down
    drop_table :accidents
  end
end
