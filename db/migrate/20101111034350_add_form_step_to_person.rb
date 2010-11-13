class AddFormStepToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :form_step, :integer
  end

  def self.down
    remove_column :people, :form_step
  end
end
