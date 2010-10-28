class AddTypeOfReferenceToReference < ActiveRecord::Migration
  def self.up
    add_column :references, :type_of_reference, :string
  end

  def self.down
    remove_column :references, :type_of_reference
  end
end
