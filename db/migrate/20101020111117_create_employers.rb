class CreateEmployers < ActiveRecord::Migration
  def self.up
    create_table :employers do |t|
      t.integer :employee_id
      t.string :company_name
      t.date :start_date
      t.date :end_date
      t.string :phone_number
      t.string :job_title
      t.string :supervisor_name
      t.string :start_salary
      t.string :end_salary
      t.string :reason_for_leaving

      t.timestamps
    end
  end

  def self.down
    drop_table :employers
  end
end
