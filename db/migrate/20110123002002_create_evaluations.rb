class CreateEvaluations < ActiveRecord::Migration
  def self.up
    create_table :evaluations do |t|
      t.integer :employee_id
      t.integer :manager_id
      t.integer :attitude
      t.integer :work_ethic
      t.integer :communication
      t.integer :abilities
      t.integer :team_work
      t.integer :appearance
      t.integer :professionalism
      t.integer :preparedness
      t.integer :organization
      t.integer :goals
      t.text :manager_comments
      t.text :employee_comments

      t.timestamps
    end
  end

  def self.down
    drop_table :evaluations
  end
end
