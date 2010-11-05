class CreateEmployeeSkills < ActiveRecord::Migration
  def self.up
    create_table :employee_skills do |t|
      t.integer :employee_id
      t.integer :skill_id

      t.timestamps
    end
  end

  def self.down
    drop_table :employee_skills
  end
end
