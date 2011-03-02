class AddAttachmentI9ImageW4ImageDriversLicenseImageToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :i9_image_file_name, :string
    add_column :users, :i9_image_content_type, :string
    add_column :users, :i9_image_file_size, :integer
    add_column :users, :i9_image_updated_at, :datetime
    add_column :users, :w4_image_file_name, :string
    add_column :users, :w4_image_content_type, :string
    add_column :users, :w4_image_file_size, :integer
    add_column :users, :w4_image_updated_at, :datetime
    add_column :users, :drivers_license_image_file_name, :string
    add_column :users, :drivers_license_image_content_type, :string
    add_column :users, :drivers_license_image_file_size, :integer
    add_column :users, :drivers_license_image_updated_at, :datetime
  end

  def self.down
    remove_column :users, :i9_image_file_name
    remove_column :users, :i9_image_content_type
    remove_column :users, :i9_image_file_size
    remove_column :users, :i9_image_updated_at
    remove_column :users, :w4_image_file_name
    remove_column :users, :w4_image_content_type
    remove_column :users, :w4_image_file_size
    remove_column :users, :w4_image_updated_at
    remove_column :users, :drivers_license_image_file_name
    remove_column :users, :drivers_license_image_content_type
    remove_column :users, :drivers_license_image_file_size
    remove_column :users, :drivers_license_image_updated_at
  end
end
