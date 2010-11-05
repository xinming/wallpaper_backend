class AddAttachmentImageToDirectory < ActiveRecord::Migration
  def self.up
    add_column :directories, :image_file_name, :string
    add_column :directories, :image_content_type, :string
    add_column :directories, :image_file_size, :integer
    add_column :directories, :image_updated_at, :datetime
  end

  def self.down
    remove_column :directories, :image_file_name
    remove_column :directories, :image_content_type
    remove_column :directories, :image_file_size
    remove_column :directories, :image_updated_at
  end
end
