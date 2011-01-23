class CreateDisciplines < ActiveRecord::Migration
  def self.up
    create_table :disciplines do |t|
      t.string :name
      t.date :occured_on
      t.integer :store_id
      t.date :verbal_warning_on
      t.string :verbal_warning_subject
      t.text :verbal_warning_reason
      t.text :verbal_warning_action
      t.date :possible_termination_on
      t.integer :supervisor_id
      t.integer :employee_id

      t.timestamps
    end
  end

  def self.down
    drop_table :disciplines
  end
end
