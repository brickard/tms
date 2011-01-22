class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.date    :submitted_at
      t.string  :description
      t.integer :amount
      t.integer :employee_id

      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end
