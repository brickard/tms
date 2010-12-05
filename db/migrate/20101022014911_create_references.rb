class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
      t.integer :user_id
      t.string :name
      t.string :contact_info
      t.string :relationship
      t.string :type_of_reference

      t.timestamps
    end
  end

  def self.down
    drop_table :references
  end
end
