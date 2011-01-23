class CreateUniforms < ActiveRecord::Migration
  def self.up
    create_table :uniforms do |t|
      t.integer :employee_id
      t.integer :count
      t.string :size

      t.timestamps
    end
  end

  def self.down
    drop_table :uniforms
  end
end
